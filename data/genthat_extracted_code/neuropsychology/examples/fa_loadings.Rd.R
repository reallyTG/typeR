library(neuropsychology)


### Name: fa_loadings
### Title: Format the loadings of a factor analysis.
### Aliases: fa_loadings

### ** Examples

require(neuropsychology)
require(psych)

df <- select_numeric(personality)
fa <- psych::fa(df)

fa_loadings(fa)$max



