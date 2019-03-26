library(LncMod)


### Name: tri.enrich
### Title: Modulator Functional Enrichment
### Aliases: tri.enrich
### Keywords: tri.enrich

### ** Examples

#Functional enrichment without disease hallmarks
tri.enrich(tri=datatests[["tri_enrich"]],GOterms=datatests[["GOterms"]],
           background=datatests[["background"]])
#Funtional enrichment with disease hallmarks
tri.enrich(tri=datatests[["tri_enrich"]],GOterms=datatests[["GOterms"]],
           background=datatests[["background"]],
		   GOterms.mark=datatests[["GOterms_mark"]])



