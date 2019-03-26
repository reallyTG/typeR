library(SARP.moodle)


### Name: affichage.moodle
### Title: Aide aux affichages dans les textes des questions
### Aliases: affichage.moodle afficher_nombre.moodle
###   afficher_echantillon.moodle

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple.affichages" )

# Catégorie : exemples
categorie.moodle( "Exemples SARP/Affichages" )

# Signe moins, décimale
vrai_faux.moodle( "Quelle est l'écriture correcte de l'opposé de cinq huitièmes?",
                  afficher_nombre.moodle( -5/8 ), -5/8 )

# Affichage des puissances
vrai_faux.moodle( paste( "L'inverse de", afficher_nombre.moodle( 10^8 ),
                         "est", afficher_nombre.moodle( 10^-8 ) ) )

# Affichage d'un échantillon
e <- rnorm( 10 ) * 2 + 20 
numerique.moodle( paste0( "Donnez la plus petite valeur de l'échantillon ci-dessous.",
                          afficher_echantillon.moodle( e ) ),
                  min( e ) )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.affichages.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.affichages.xml dans Moodle pour voir le résultat..." )



