library(atlantistools)


### Name: preprocess_txt
### Title: Preprocess dataframes loaded in with 'load_txt()'
### Aliases: preprocess_txt

### ** Examples

d <- system.file("extdata", "setas-model-new-becdev", package = "atlantistools")
df <- load_txt(file = file.path(d, "outputSETASSpecificPredMort.txt"))
df <- preprocess_txt(df_txt = df, into = c("pred", "agecl", "empty_col1", "prey", "empty_col2"))
head(df)

df <- load_txt(file = file.path(d, "outputSETASSpecificMort.txt"))
df <- preprocess_txt(df_txt = df, into = c("species", "agecl", "empty_col", "mort"))
head(df)



