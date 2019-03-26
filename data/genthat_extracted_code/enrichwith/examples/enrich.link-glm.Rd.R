library(enrichwith)


### Name: enrich.link-glm
### Title: Enrich objects of class 'link-glm'
### Aliases: enrich.link-glm

### ** Examples


# Example
elogit <- enrich(make.link("logit"), with = "inverse link derivatives")
str(elogit)
elogit$d2mu.deta
elogit$d3mu.deta



