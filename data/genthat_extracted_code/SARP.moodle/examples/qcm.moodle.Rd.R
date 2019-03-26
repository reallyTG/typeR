library(SARP.moodle)


### Name: qcm.moodle
### Title: Créer une question à choix (réponse unique ou réponses
###   multiples)
### Aliases: qcm qcm.moodle

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple.QCM" )

# Catégorie : exemples
categorie.moodle( "Exemples SARP/QCM" )

# Le format par défaut, avec deux bonnes réponses et trois mauvaises,
qcm.moodle( "Quels sont les fruits de la liste ci-dessous&thinsp;?",
            c( "Orange", "Tomate" ), c( "Pomme de terre", "Carotte", "Navet" ) )

# Deux bonnes réponses, deux mauvaises réponses, avec commentaires
#   et fractions inégales
qcm.moodle( "Indiquez les romanciers de la liste ci-dessous.",
            c( "Eugène&nbsp;S<small>UE</small>", "Alexandre&nbsp;D<small>UMAS</small>" ),
            c( "Labiche", "Ronsard" ),
            commentaires = c( "Bravo&thinsp;!", NA,
                 "C'est un auteur de pièces de théâtre", "C'est un poète" ),
            fractions = list( "Bonnes"  = c( 75, 25 ),
                              "Fausses" = c( -50, -100 ) ) )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.QCM.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.QCM.xml dans Moodle pour voir le résultat..." )



