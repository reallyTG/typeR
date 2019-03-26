library(psycho)


### Name: standardize.data.frame
### Title: Standardize (scale and reduce) Dataframe.
### Aliases: standardize.data.frame

### ** Examples

## Not run: 
##D df <- data.frame(
##D   Participant = as.factor(rep(1:25, each = 4)),
##D   Condition = base::rep_len(c("A", "B", "C", "D"), 100),
##D   V1 = rnorm(100, 30, .2),
##D   V2 = runif(100, 3, 5),
##D   V3 = rnorm(100, 100, 10)
##D )
##D 
##D dfZ <- standardize(df)
##D dfZ <- standardize(df, except = "V3")
##D dfZ <- standardize(df, except = c("V1", "V2"))
##D dfZ <- standardize(df, subset = "V3")
##D dfZ <- standardize(df, subset = c("V1", "V2"))
##D dfZ <- standardize(df, normalize = TRUE)
##D 
##D # Respects grouping
##D dfZ <- df %>%
##D   dplyr::group_by(Participant) %>%
##D   standardize(df)
## End(Not run)




