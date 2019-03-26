library(mvbutils)


### Name: warn.and.subset
### Title: Extract subset and warn about omitted cases
### Aliases: warn.and.subset
### Keywords: misc

### ** Examples

df <- data.frame( a=1:3, b=letters[1:3])
df1 <- warn.and.subset( df, a %% 2 == 1, 'Boring example data.frame', 'even-valued "a"')
condo <- quote( a %% 2 == 1)
df2 <- warn.and.subset( df, condo, 'Same boring data.frame', deparse( condo), sub=FALSE)



