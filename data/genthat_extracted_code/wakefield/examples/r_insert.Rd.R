library(wakefield)


### Name: r_insert
### Title: Insert Data Frames Into 'r_data_frame'
### Aliases: r_insert
### Keywords: insert

### ** Examples

dat <- dplyr::data_frame(
    Age_1 = age(100), Age_2 = age(100), Age_3 = age(100),
    Smokes = smokes(n=100),
    Sick = ifelse(Smokes, sample(5:10, 100, TRUE), sample(0:4, 100, TRUE)),
    Death = ifelse(Smokes, sample(0:1, 100, TRUE, prob = c(.2, .8)),
        sample(0:1, 100, TRUE, prob = c(.7, .3)))
)

r_data_frame(100,
   id,
   r_insert(dat)
)

r_list(10,
   id,
   r_insert(dat)
)



