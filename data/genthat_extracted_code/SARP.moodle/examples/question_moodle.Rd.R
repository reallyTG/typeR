library(SARP.moodle)


### Name: question.moodle
### Title: Créer une question Moodle au format XML
### Aliases: question.moodle

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple.question" )

# Catégorie : exemples
categorie.moodle( "Exemples SARP/Question" )

# Une question vrai-faux (en utilisant le type binaire)
reponses <- c( "Vrai", "Faux" )
attr( reponses, "commentaire" ) <- c( "Bravo !", "Elle n'est pas plate" )
attr( reponses, "fractions" ) <- c( 100, 0 )
question.moodle( type  = "truefalse", titre = "Question binaire",
                 texte = "La Terre est ronde", reponses = reponses )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.question.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.question.xml dans Moodle pour voir le résultat..." )



