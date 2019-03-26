library(SARP.moodle)


### Name: libre.moodle
### Title: Créer une question libre (« cloze », texte à compléter)
### Aliases: libre.moodle question_libre.moodle

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple.libre" )

# Catégorie : exemples
categorie.moodle( "Exemples SARP/Question libre" )

# Une question Moodle libre avec champs numériques
question_libre.moodle( "Indiquez les chiffres du nombre 1974.",
                       list( "Unité : ", " — dizaine : ",
                             " — centaine : ", " — milliers : " ), ".",
                       reponses = list( 4, 7, 9, 1 ) )

# Avec un champ numérique et des champs à choix multiples
question_libre.moodle( "<cite>Le Corbeau et le Renard</cite>.",
                       list( "<i>Maître ",
                             " sur son arbre perché<br />Tenait en son bec un ",
                             ".<br />Maître ",
                             "</i>par l'odeur alléché<br />... est un poème composé en " ),
                       " par le poète Jean de la Fontaine.",
                       types = c( "MULTICHOICE", "MULTICHOICE_H",
                                  "SHORTANSWER", "NUMERICAL" ),
                       reponses = list( list( "Textes"  = c( "Renard", "Goupil",
                                                             "Corbeau", "Corneille" ),
                                              "Correct" = c( FALSE, FALSE, TRUE, FALSE ) ),
                                        list( "Textes"  = c( "Fromage", "Camembert",
                                                             "Bleu", "Livre" ), 
                                              "Correct" = c( TRUE, FALSE, FALSE, FALSE ) ),
                                        list( "Textes"  = c( "Renard", "Goupil",
                                                             "Corbeau", "Corneille" ),
                                              "Correct" = c( TRUE, FALSE, FALSE, FALSE ) ),
                                        1668 ) )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.libre.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.libre.xml dans Moodle pour voir le résultat..." )



