library(SARP.moodle)


### Name: debuter_xml.moodle
### Title: Commencer et terminer un questionnaire Moodle
### Aliases: debuter_xml.moodle finir_xml.moodle

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple" )

# Une question Moodle basique
vrai_faux.moodle( "Cette question a deux réponses" )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.xml dans Moodle pour voir le résultat..." )



