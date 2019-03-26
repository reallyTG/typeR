library(SARP.moodle)


### Name: qroc.moodle
### Title: Créer une question à réponse ouverte, courte
### Aliases: qroc.moodle qroc

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple.qroc" )

# Catégorie : exemples
categorie.moodle( "Exemples SARP/QROC" )

# Une question Moodle en QROC, avec une seule bonne réponse
qroc.moodle( "Quel est le prénom de Victor&nbsp;H<small>UGO</small>&thinsp;?",
             "Victor" )

# La même, en indiquant que l'initiale doit être en majuscule
qroc.moodle( "Quel est le prénom de Victor&nbsp;H<small>UGO</small>&thinsp;?",
             c( "Victor", "victor" ),
             notes = c( 100, 50 ),
             commentaires = c( NA, "N'oubliez pas la majuscule aux noms propres&thinsp;!" ) )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.numerique.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.numerique.xml dans Moodle pour voir le résultat..." )



