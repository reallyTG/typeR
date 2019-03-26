library(spduration)
context("Test add_duration")

test_that("Correct output given time frequency", {
  
  # Test for yearly data
  data <- data.frame(y=c(0,0,0,1,0), 
                      unitID=c(1,1,1,1,1), 
                      tID=c(2000, 2001, 2002, 2003, 2004))
  
  expect_warning(add_duration(data, "y", "unitID", "tID", freq="year"))
  
  test <- suppressWarnings(
    add_duration(data, "y", "unitID", "tID", freq="year")
  )
  
  goal <- structure(
    list( y = c(0, 0, 0, 1, 0), 
          unitID = c(1, 1, 1, 1, 1), 
          tID = c(2000, 2001, 2002, 2003, 2004), 
          failure = c(0, 0, 0, 1, 0), 
          ongoing = c(0, 0, 0, 0, 0), 
          end.spell = c(0, 0, 0, 1, 1), 
          cured = c(0, 0, 0, 0, 1), 
          atrisk = c(1, 1, 1, 1, 0), 
          censor = c(0, 0, 0, 0, 1), 
          duration = c(1, 2, 3, 4, 1), 
          t.0 = c(0, 1, 2, 3, 0)), 
     .Names = c("y", "unitID", "tID", "failure", "ongoing", 
                "end.spell", "cured", "atrisk", "censor", "duration", "t.0"), 
     class = "data.frame", row.names = c(2L, 3L, 4L, 5L, 1L))
  expect_equivalent(test, goal)
  
  
})


# # Test for daily data
# data <- data.frame(
#   tID=c(rep(seq.Date(as.Date("2000-01-01"), by="day", length.out=10), 2)),
#   unitID=c(rep(1, 10), rep(2, 10)),
#   y=c(rep(0, 8),1,0, 0,1,1,rep(0, 6),1)
#   )
# test <- buildDuration(data, "y", "unitID", "tID", freq="day")
# goal <- structure(list(
#   spellID = c(4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 2, 2, NA, 1, 1, 1, 1, 1, 1, 1), 
#   tID = c("2000-01-01", "2000-01-02", "2000-01-03", "2000-01-04", "2000-01-05", 
#           "2000-01-06", "2000-01-07", "2000-01-08", "2000-01-09", "2000-01-10", 
#           "2000-01-01", "2000-01-02", "2000-01-03", "2000-01-04", "2000-01-05", 
#           "2000-01-06", "2000-01-07", "2000-01-08", "2000-01-09", "2000-01-10"), 
#   unitID = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2), 
#   y = c(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1), 
#   failure = c(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, NA, 0, 0, 0, 0, 0, 0, 1), 
#   ongoing = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0), 
#   end.spell = c(0,  0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, NA, 0, 0, 0, 0, 0, 0, 1), 
#   cured = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NA, 0, 0, 0, 0, 0, 0, 0), 
#   atrisk = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, NA, 1, 1, 1, 1, 1, 1, 1), 
#   censor = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NA, 0, 0, 0, 0, 0, 0, 0), 
#   duration = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 1, 2, NA, 1, 2, 3, 4, 5, 6, 7), 
#   t.0 = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 1, NA, 0, 1, 2, 3, 4, 5, 6)), 
#   .Names = c("spellID", "tID", "unitID", "y", "failure", "ongoing", "end.spell", 
#              "cured", "atrisk", "censor", "duration", "t.0"), 
#   class = "data.frame", 
#   row.names = c(13L, 14L, 11L, 12L, 17L, 18L, 15L, 16L, 19L, 10L, 8L, 9L, 20L, 
#                 1L, 2L, 3L, 4L, 5L, 6L, 7L))
# all(goal==test, na.rm=T)

# # Test sorting
# data <- data.frame(
#   y=c(0,0,0,1,0), 
#   unitID=c(1,1,1,1,1), 
#   tID=c(2000, 2001, 2002, 2003, 2004))
# data <- data[sample(1:5), ]
# test <- buildDuration(data, "y", "unitID", "tID", freq="year")
# goal <- data[, c("unitID", "tID")]
# all(goal==test[, c("unitID", "tID")])

# # Test ongoing spells option
# data <- data.frame(
#   y=c(0, 0, 0, 1, 1, 0),
#   unitID=rep(1, 6),
#   tID=c(2000:2005))
# test <- buildDuration(data, "y", "unitID", "tID", freq="year", ongoing=FALSE)
# goal <- structure(list(spellID = c(3, 3, 3, 3, 2, 1), y = c(0, 0, 0, 
# 1, 1, 0), unitID = c(1, 1, 1, 1, 1, 1), tID = c("2000", "2001", 
# "2002", "2003", "2004", "2005"), failure = c(0, 0, 0, 1, 1, 0
# ), ongoing = c(0, 0, 0, 0, 0, 0), end.spell = c(0, 0, 0, 1, 1, 
# 1), cured = c(0, 0, 0, 0, 0, 1), atrisk = c(1, 1, 1, 1, 1, 0), 
#     censor = c(0, 0, 0, 0, 0, 1), duration = c(1, 2, 3, 4, 1, 
#     1), t.0 = c(0, 1, 2, 3, 0, 0)), .Names = c("spellID", "y", 
# "unitID", "tID", "failure", "ongoing", "end.spell", "cured", 
# "atrisk", "censor", "duration", "t.0"), class = "data.frame", row.names = c(3L, 
# 4L, 5L, 6L, 2L, 1L))
# all(goal==test)

