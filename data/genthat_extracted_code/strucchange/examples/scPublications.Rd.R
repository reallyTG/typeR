library(strucchange)


### Name: scPublications
### Title: Structural Change Publications
### Aliases: scPublications
### Keywords: datasets

### ** Examples

## construct time series:
## number of sc publications in econometrics/statistics
data("scPublications")

## select years from 1987 and
## `most important' journals
pub <- scPublications
pub <- subset(pub, year > 1986)
tab1 <- table(pub$journal)
nam1 <- names(tab1)[as.vector(tab1) > 9] ## at least 10 papers
tab2 <- sapply(levels(pub$journal), function(x) min(subset(pub, journal == x)$year))
nam2 <- names(tab2)[as.vector(tab2) < 1991] ## started at least in 1990
nam <- nam1[nam1 %in% nam2]
pub <- subset(pub, as.character(journal) %in% nam)
pub$journal <- factor(pub$journal)
pub_data <- pub

## generate time series
pub <- with(pub, tapply(type, year, table))
pub <- zoo(t(sapply(pub, cbind)), 1987:2006)
colnames(pub) <- levels(pub_data$type)

## visualize
plot(pub, ylim = c(0, 35))



