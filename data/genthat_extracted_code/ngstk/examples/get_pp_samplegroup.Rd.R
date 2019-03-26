library(ngstk)


### Name: get_pp_samplegroup
### Title: Function to get samplegroup file that can be pass to
###   Proteinpaint
### Aliases: get_pp_samplegroup

### ** Examples

samples <- sprintf('A%s', 1:7)
group <- 'B-ALL'
samplegroup <- get_pp_samplegroup(samples, group)
outfn <- tempfile()
samplegroup <- get_pp_samplegroup(samples, group, outfn)



