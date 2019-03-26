library(SARP.moodle)


### Name: vf.moodle
### Title: Créer une question à deux réponses possibles, dont une seule
###   vraie
### Aliases: vrai_faux.moodle

### ** Examples

# Commencer un nouveau questionnaire
q <- debuter_xml.moodle( "exemple.VF" )

# Catégorie : exemples
categorie.moodle( "Exemples SARP/Vrai ou Faux" )

# Le format par défaut
vrai_faux.moodle( "Une question « vrai ou faux » offre le choix entre deux réponses" )

# et si la bonne réponse est « faux »
vrai_faux.moodle( "Le Soleil tourne autour de la Terre", "Faux", "Vrai" )

# avec des intitulés libres
vrai_faux.moodle( "La bataille de Marignan a eu lieu en...", "1515", "1914" )

# On termine le questionnaire
finir_xml.moodle( )

# Importez le fichier exemple.VF.xml dans Moodle pour voir le résultat...
print( "Importez le fichier exemple.VF.xml dans Moodle pour voir le résultat..." )



