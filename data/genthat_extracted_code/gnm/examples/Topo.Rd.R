library(gnm)


### Name: Topo
### Title: Topological Interaction of Factors
### Aliases: Topo
### Keywords: models

### ** Examples

set.seed(1)

### Collapse to 7 by 7 table as in Erikson (1982)

erikson <- as.data.frame(erikson)
lvl <- levels(erikson$origin)
levels(erikson$origin) <- levels(erikson$destination) <-
    c(rep(paste(lvl[1:2], collapse = " + "), 2), lvl[3],
      rep(paste(lvl[4:5], collapse = " + "), 2), lvl[6:9])
erikson <- xtabs(Freq ~ origin + destination + country, data = erikson)

### Create array of interaction levels as in Table 2 of Xie (1992)

levelMatrix <- matrix(c(2, 3, 4, 6, 5, 6, 6,
                        3, 3, 4, 6, 4, 5, 6,
                        4, 4, 2, 5, 5, 5, 5,
                        6, 6, 5, 1, 6, 5, 2,
                        4, 4, 5, 6, 3, 4, 5,
                        5, 4, 5, 5, 3, 3, 5,
                        6, 6, 5, 3, 5, 4, 1), 7, 7, byrow = TRUE)

### Fit the levels models given in Table 3 of Xie (1992)

## Null association between origin and destination
nullModel <- gnm(Freq ~ country:origin + country:destination,
                 family = poisson, data = erikson)

## Interaction specified by levelMatrix, common to all countries
commonTopo <- update(nullModel, ~ . +
                     Topo(origin, destination, spec = levelMatrix))

## Interaction specified by levelMatrix, different multiplier for
## each country
multTopo <- update(nullModel, ~ . +
                   Mult(Exp(country),
                        Topo(origin, destination, spec = levelMatrix)))

## Interaction specified by levelMatrix, different effects for
## each country
separateTopo <- update(nullModel, ~ . +
                       country:Topo(origin, destination,
                                    spec = levelMatrix))



