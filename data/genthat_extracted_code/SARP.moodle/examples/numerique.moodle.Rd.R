library(SARP.moodle)


### Name: numerique.moodle
### Title: Créer une question à réponse numérique simple
### Aliases: numerique.moodle

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple.numerique" )

# Catégorie : exemples
categorie.moodle( "Exemples SARP/Numérique" )

# Une question Moodle numérique, avec 3 décimales
numerique.moodle( "Donnez la valeur de &pi;", pi, n.decimales = 3 )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.numerique.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.numerique.xml dans Moodle pour voir le résultat..." )



