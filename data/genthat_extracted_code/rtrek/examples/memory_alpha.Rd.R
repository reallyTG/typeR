library(rtrek)


### Name: memory_alpha
### Title: Memory Alpha API
### Aliases: memory_alpha

### ** Examples

memory_alpha("portals") # show available portals
if(has_internet()){
  memory_alpha("people") # show portal categories for People portal
  memory_alpha("people/Klingons") # show people in Klingons subcategory
  memory_alpha("people/Klingons/Worf") # return terminal article content
}



