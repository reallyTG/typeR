library(jsTree)


### Name: jsTree
### Title: Htmlwidget for the jsTree Javascript library
### Aliases: jsTree

### ** Examples

if(interactive()){

data(states)
data(state_bird)

#collapse columns to text (with sep "/")
nested_string <- apply(states,1,paste,collapse='/')
jsTree(nested_string)

# Add tooltips to state names with the state bird 
jsTree(nested_string,tooltips = state_bird)

#initialize tree with checked boxes for certain fields
nodestate1 <- states$variable=='Area'
jsTree(nested_string,nodestate=nodestate1)

nodestate2 <- states$variable=='Area'&grepl('^M',states$state.name)
jsTree(nested_string,nodestate=nodestate2)

nodestate3 <- states$variable %in% c('Murder') & states$value >= 10
nodestate4 <- states$variable %in% c('HS.Grad') & states$value <= 55
jsTree(nested_string,nodestate=nodestate3|nodestate4)

#change the order of the hierarchy
nested_string2 <- apply(states[,c(4,1,2,3,5)],1,paste,collapse='/')

jsTree(nested_string2)

#use jsTree to visualize folder structure

jsTree(list.files(full.names = TRUE,recursive = FALSE))

## Not run: 
##D # This may be too long for example if running from ~.
##D jsTree(list.files(full.names = TRUE,recursive = TRUE))
## End(Not run)
}




