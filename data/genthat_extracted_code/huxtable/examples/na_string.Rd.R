library(huxtable)


### Name: na_string
### Title: NA string
### Aliases: na_string na_string<- set_na_string map_na_string

### ** Examples


na_string(jams) <-  "--"
na_string(jams)
jams[2,2] <- NA 
jams

jams2 <- set_na_string(jams,
      "--")
na_string(jams2)

jams3 <- set_na_string(jams,
      2:3, 1, "--")
na_string(jams3)

jams4 <- map_na_string(jams,
      by_rows(
        "--",
        "")
      )
na_string(jams4)



