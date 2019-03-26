library(sjmisc)


### Name: to_long
### Title: Convert wide data to long format
### Aliases: to_long

### ** Examples

# create sample
mydat <- data.frame(age = c(20, 30, 40),
                    sex = c("Female", "Male", "Male"),
                    score_t1 = c(30, 35, 32),
                    score_t2 = c(33, 34, 37),
                    score_t3 = c(36, 35, 38),
                    speed_t1 = c(2, 3, 1),
                    speed_t2 = c(3, 4, 5),
                    speed_t3 = c(1, 8, 6))

# check tidyr. score is gathered, however, speed is not
tidyr::gather(mydat, "time", "score", score_t1, score_t2, score_t3)

# gather multiple columns. both time and speed are gathered.
to_long(
  data = mydat,
  keys = "time",
  values = c("score", "speed"),
  c("score_t1", "score_t2", "score_t3"),
  c("speed_t1", "speed_t2", "speed_t3")
)

# gather multiple columns, use numeric key-value
to_long(
  data = mydat,
  keys = "time",
  values = c("score", "speed"),
  c("score_t1", "score_t2", "score_t3"),
  c("speed_t1", "speed_t2", "speed_t3"),
  recode.key = TRUE
)

# gather multiple columns by colum names and colum indices
to_long(
  data = mydat,
  keys = "time",
  values = c("score", "speed"),
  c("score_t1", "score_t2", "score_t3"),
  6:8,
  recode.key = TRUE
)

# gather multiple columns, use separate key-columns
# for each value-vector
to_long(
  data = mydat,
  keys = c("time_score", "time_speed"),
  values = c("score", "speed"),
  c("score_t1", "score_t2", "score_t3"),
  c("speed_t1", "speed_t2", "speed_t3")
)

# gather multiple columns, label columns
mydat <- to_long(
  data = mydat,
  keys = "time",
  values = c("score", "speed"),
  c("score_t1", "score_t2", "score_t3"),
  c("speed_t1", "speed_t2", "speed_t3"),
  labels = c("Test Score", "Time needed to finish")
)

library(sjlabelled)
str(mydat$score)
get_label(mydat$speed)




