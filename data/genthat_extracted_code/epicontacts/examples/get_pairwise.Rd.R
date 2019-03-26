library(epicontacts)


### Name: get_pairwise
### Title: Characterise contacts by comparing case attributes
### Aliases: get_pairwise

### ** Examples

if (require(outbreaks)) {
## example using MERS outbreak in Korea, 2014
head(mers_korea_2015[[1]])
head(mers_korea_2015[[2]])

x <- make_epicontacts(linelist=mers_korea_2015[[1]],
contacts=mers_korea_2015[[2]], directed=TRUE)

## estimate serial interval (onset->onset)
SI <- get_pairwise(x, "dt_onset")
SI
summary(SI)
hist(SI, col="grey", border="white", xlab="Days after symptoms",
     main="MERS Korea 2014 - Serial Interval")

## check gender mixing:
get_pairwise(x, "sex") # not good, we want 2-way table

get_pairwise(x, "sex", f=table) # use custom function
fisher.test(get_pairwise(x, "sex", f=table)) # test association
}



