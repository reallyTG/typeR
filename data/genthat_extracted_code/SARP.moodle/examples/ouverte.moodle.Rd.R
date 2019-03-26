library(SARP.moodle)


### Name: ouverte.moodle
### Title: Créer une question à réponse ouverte (rédactionnelle)
### Aliases: ouverte.moodle question_ouverte.moodle

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple.ouverte" )

# Catégorie : exemples
categorie.moodle( "Exemples SARP/Question ouverte" )

# Une question Moodle ouverte
question_ouverte.moodle( "Racontez votre journ&eacute;e." )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.ouverte.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.ouverte.xml dans Moodle pour voir le résultat..." )



