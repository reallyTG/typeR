library(epicontacts)


### Name: graph3D
### Title: Interactive 3D Force-directed graph from epicontacts object
### Aliases: graph3D

### ** Examples

if (require(outbreaks)) {

## example using MERS outbreak in Korea, 2014
head(mers_korea_2015[[1]])
head(mers_korea_2015[[2]])

x <- make_epicontacts(linelist = mers_korea_2015$linelist,
                      contacts = mers_korea_2015$contacts,
                      directed = FALSE)

## Not run: 
##D graph3D(x)
##D graph3D(x, annot = FALSE)
##D graph3D(x, node_color = "sex", g_title = "MERS Korea 2014")
##D graph3D(x, node_color = "sex", annot = c("sex", "age"),
##D         g_title = "MERS Korea 2014")
## End(Not run)
}



