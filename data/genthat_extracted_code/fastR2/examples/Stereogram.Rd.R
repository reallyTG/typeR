library(fastR2)


### Name: Stereogram
### Title: Stereogram fusion
### Aliases: Stereogram
### Keywords: datasets

### ** Examples


data(Stereogram)
favstats(time ~ group, data = Stereogram)
gf_violin(time ~ group, data = Stereogram, alpha = 0.2, fill = "skyblue") %>%
gf_jitter(time ~ group, data = Stereogram, height = 0, width = 0.25)




