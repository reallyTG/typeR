library(SARP.moodle)


### Name: categorie.moodle
### Title: Créer une catégorie de questions
### Aliases: categorie.moodle

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple.categorie" )

# Catégorie des questions numériques pour les exemples de cette documentation
categorie.moodle( "Exemples SARP/Numériques" )
numerique.moodle( "Combien vaut 1&nbsp;+&nbsp;1&thinsp;?", 2 )
numerique.moodle( "Combien vaut 1&nbsp;&times&nbsp;1&thinsp;?", 1 )
numerique.moodle( "Combien vaut 1&nbsp;+&nbsp;1 en binaire&thinsp;?", 10 )

# Catégorie des QROC pour les exemples de cette documentation
categorie.moodle( "Exemples SARP/QROC" )
qroc.moodle( "Comment s'appelle cette biblioth&egrave;que&thinsp;?", "SARP.Moodle" )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.categorie.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.categorie.xml dans Moodle pour voir le résultat..." )



