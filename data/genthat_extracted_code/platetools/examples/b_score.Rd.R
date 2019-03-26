library(platetools)


### Name: b_score
### Title: 2 way median polish
### Aliases: b_score

### ** Examples

df <- data.frame(well = num_to_well(1:96),
                 vals = rnorm(96))

b_score(data = df$vals,
        well = df$well,
        plate = 96)



