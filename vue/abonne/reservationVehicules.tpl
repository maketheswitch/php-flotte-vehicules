<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Accueil</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Highlight-Phone.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#">Brand</a><span>
                <?php echo $_SESSION['profil']['nom']; ?>
            </span><button data-bs-toggle="collapse" data-bs-target="#navcol-1" class="navbar-toggler"><span
                    class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse d-xl-flex justify-content-xl-center" id="navcol-1">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="#">Véhicules</a></li>
                    <li class="nav-item"><a class="nav-link"
                            href="index.php?controle=abonne&amp;action=affichageFactures">Facturation</a></li>
                    <li class="nav-item"></li>
                </ul>
            </div><a class="btn btn-primary" role="button" href="index.php?controle=abonne&amp;action=deconnexion"
                style="background: var(--bs-pink);">Se déconnecter</a>
        </div>
    </nav>
    <div class="card">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item"><a class="nav-link"
                        href="index.php?controle=abonne&amp;action=accueilAbonne">Véhicules en cours de location</a>
                </li>
                <li class="nav-item"><a class="nav-link active"
                        href="#">Réservation de véhicules</a></li>
            </ul>
        </div>
        <div class="card-body">
            <h1 class="text-center card-title">Choisissez un véhicule dans la liste</h1>
            <p class="card-text">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac
                facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p>
            <form class="d-flex flex-column" method="POST">
                    <?php 
                        if(!empty($vehicules)){
                            echo '<div class="container-fluid shadow-lg d-flex flex-row flex-wrap justify-content-xl-end"><a
                            class="btn btn-primary shadow-lg" role="button" type="submit"
                            href="index.php?controle=abonne&amp;action=reservationVehicules">Réserver la sélection</a></div>';

                            echo '<div class="container-fluid shadow-lg d-flex flex-row flex-wrap">';


                            foreach($vehicules as $vehicule){
                                $specs = array();
                                $specs = json_decode($vehicule['specs'], true);
                                echo '<div class="card mb-3" style="max-width: 540px;">';
                                echo '<div class="row g-0" >';
                                echo '<div class="col-md-4" style="overflow: hidden;">';
                                echo '<img src="'. $vehicule['image'] . '" class="img-fluid rounded-start" alt="Photo de ' . $vehicule['type'] . '" style="min-width: 145%;">';
                                echo '</div>';
                                echo '<div class="col-md-8"><div class="card-body">';
                                echo '<h5 class="card-title">' . $vehicule['type'] . '</h5>';
                                echo '<p class="card-text">' . $specs['moteur'] . '</p>';
                                echo '<div class="form-check"><input type="checkbox" class="form-check-input"
                                id="form-Check-' . $vehicule['id'] . '" value="' . $vehicule['id'] .'" /><label class="form-check-label"
                                            for="form-Check-' . $vehicule['id'] . '">Sélectionner le véhicule</label></div>';
                                echo '</div></div></div></div>';
                            }

                            echo '</div>';

                        }else{
                            echo '<div role="alert" class="alert alert-warning d-xl-flex justify-content-xl-center"><span><strong>Aucun véhicule disponible à la location</strong></span></div>';
                        }
                    ?>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>