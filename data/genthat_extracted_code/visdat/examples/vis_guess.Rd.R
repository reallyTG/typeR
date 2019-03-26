library(visdat)


### Name: vis_guess
### Title: Visualise type guess in a data.frame
### Aliases: vis_guess

### ** Examples


messy_vector <- c(TRUE,
                 "TRUE",
                 "T",
                 "01/01/01",
                 "01/01/2001",
                 NA,
                 NaN,
                 "NA",
                 "Na",
                 "na",
                 "10",
                 10,
                 "10.1",
                 10.1,
                 "abc",
                 "$%TG")
set.seed(1114)
messy_df <- data.frame(var1 = messy_vector,
                       var2 = sample(messy_vector),
                       var3 = sample(messy_vector))
vis_guess(messy_df)



