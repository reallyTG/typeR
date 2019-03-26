library(staRdom)


### Name: eem_exclude
### Title: Exclude complete wavelengths or samples form data set
### Aliases: eem_exclude

### ** Examples

data(eem_list)

exclude <- list("ex" = c(280,285,290,295),
"em" = c(),
"sample" = c("sample3","sample5","sample14")
)

eem_list_ex <- eem_exclude(eem_list, exclude)



