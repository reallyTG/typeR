library(hctrial)


### Name: strat_end
### Title: Adjust a subspace stratified design at the end of the study.
### Aliases: strat_end

### ** Examples

p0_sub <- c(0.1, 0.3, 0.5)
p1_sub <- c(0.3, 0.5, 0.7)
distr_sub <- c(1/3, 1/3, 1/3)
start <- strat_start(p0_sub, p1_sub, distr_sub)
n1 <- start$des_start[2]
subone <- sample(c(1,2,3), n1, TRUE)
interim <- strat_interim(start, subone)
n2 <- interim$des_interim[4]
subtwo <- sample(c(1,2,3), n2, TRUE)
strat_end(interim, subtwo)



