# context("prevtab")
# 
# 
# 
# test_that("prevtab produces intended results", {
#   
#   
#   mp <- data.table(popEpi::meanpop_fi)
#   setnames(mp, c("year", "agegroup"), c("per", "age"))
#   x <- lexpand(popEpi::sire, 
#                birth = bi_date, entry = dg_date, exit = ex_date,
#                status = status %in% 1:2)
#   pt1 <- prevtab(per ~ sex + fot, data = x, meanpop = mp,
#                  breaks = list(per = 2009:2014, fot = c(0,1,5,10,Inf)),
#                  adjust = "agegroup", weights = "internal")
#   pt2 <- prevtab(per ~ sex + work, data = x, meanpop = mp,
#                  breaks = list(per = 2009:2014, work = c(0,1,5,10,Inf)),
#                  adjust = "agegroup", weights = "internal")
#   
#   
# })