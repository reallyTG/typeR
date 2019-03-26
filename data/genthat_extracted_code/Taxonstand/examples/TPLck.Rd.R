library(Taxonstand)


### Name: TPLck
### Title: Standardize a plant name according to The Plant List.
### Aliases: TPLck
### Keywords: vegetation analysis

### ** Examples

## Not run: 
##D # An accepted name
##D (TPLck("Amblystegium serpens juratzkanum"))
##D 
##D # An unresolved name
##D (TPLck("Bryum capillare cenomanicum"))
##D 
##D # A synonym
##D (TPLck("Pottia acutidentata"))
##D 
##D # A misapplied name
##D (TPLck("Colutea istria"))
##D 
##D # A name that is not in TPL
##D (TPLck("Hypochoeris balbisii"))
##D 
##D # A spelling error in the specific epithet
##D (TPLck("Pohlia longicola", corr = TRUE))
##D 
##D # A spelling error that is not corrected ('max.distance' defaults to 1)
##D (TPLck("Microbryum curvicollum", corr = TRUE))
##D 
##D # If increasing 'max.distance', the spelling error is accounted for
##D (TPLck("Microbryum curvicollum", corr = TRUE, max.distance = 3))
##D 
##D # A spelling error where the ending is changed to the 
##D # neuter/feminine form
##D (TPLck("Symphytum officinalis"))
##D (TPLck("Schinus terebinthifolium"))
##D 
##D # A spelling error that is not corrected because two different results
##D # are possible (see Details)
##D (TPLck("Acacia macrocantha"))
##D 
##D # A taxon matched through author name
##D (TPLck("Gladiolus communis L. subsp. byzantinus (Mill.) A.P.Ham."))
##D 
##D # If only the current author is provided (without the author of the
##D # basionym), the function still matches the correct taxon (even though
##D # adist returns a better overall match for the author of the homonym,
##D # Abies alba Mill.)
##D (TPLck("Abies alba Michx."))
##D 
##D # A difference between TPL versions 1.0 and 1.1
##D (TPLck("Fallopia japonica", version = "1.0"))
##D (TPLck("Fallopia japonica", version = "1.1"))
##D 
##D # Avoid illegitimate names when choosing between multiple synonyms
##D (TPLck("Anthemis altissima"))
##D 
##D # A nominal subspecies not in TPL (Higher.level == TRUE; 
##D # Plant.Name.Index == TRUE)
##D (TPLck("Callitriche brutia Petagna subsp. brutia"))
##D 
##D # A variety not in TPL (Higher.level == TRUE; Plant.Name.Index == FALSE)
##D (TPLck("Asplenium ruta-muraria var. lanceolum"))
##D 
##D # A taxon matched through infraspecific rank abbreviation
##D (TPLck("Heliopsis helianthoides subsp. scabra"))
##D 
##D # Drop variety and keep subspecies
##D (TPLck("Vicia sativa L. subsp. nigra (L.) Ehrh. var. minor (Bertol.) Gaudin",
##D drop.lower.level = TRUE))
##D 
##D # Drop nominal subspecies and keep variety
##D (TPLck("Anagallis arvensis subsp. arvensis var. caerulea", 
##D drop.lower.level = TRUE))
## End(Not run)



