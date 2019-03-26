library(“tidyverse”)
ex1t <- ex1t %>%
  mutate(end.spell = as.integer(tstop==time))
  
mdl1 <- spdur(tstop ~ death + ethn, status.ov ~ death + ethn, data = ex1t,
               last = "end.spell", t.0 = "tstart", fail = "status.int",
              silent = TRUE)
summary(mdl1)