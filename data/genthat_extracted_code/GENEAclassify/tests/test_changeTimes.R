# SVN revision:   
# Date of last change: 2017-08-24
# Last changed by: csweetland
# 
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("change duration")

###############################################################################

test_that("changeTimes", {
    
    d1 <- c(54, 30, 27, 53, 100, 204, 197)
    d2 <- c(67, 64, 70, 79, 69, 60, 54)
    
    c1 <- cpt.var(d1, penalty = "SIC", pen.value = 1e-3, method = "PELT")
    c2 <- cpt.var(d2, penalty = "SIC", pen.value = 1e-3, method = "PELT")
    
    cd1 <- changeTimes(time = 0:6, intervalseconds = 30, 
        changeupdown = c1, changedegrees = c2)
    
    expect_that(cd1, equals(c(0, 6)))
    
    cd2 <- changeTimes(time = 0:6, intervalseconds = 1, 
        changeupdown = c1, changedegrees = c2, verbose = FALSE)
    
    expect_that(cd2, equals(c(0, 1, 6)))
    
    df3 <- read.csv(file.path(system.file(package = "GENEAclassify"), 
            "testdata", "leftcal2.csv"))
    
    c13 <- cpt.var(df3$UpDown, penalty = "SIC", pen.value = 1e-3, method = "PELT")
    c23 <- cpt.var(df3$Degrees, penalty = "SIC", pen.value = 1e-3, method = "PELT")
    
    cd3 <- changeTimes(time = df3$Time, intervalseconds = 30, changeupdown = c13, changedegrees = c23)
    
    expect_that(cd3, equals(c(1390127160.5, 1390127351.5)))
    
    cd4 <- changeTimes(time = df3$Time, intervalseconds = 0, changeupdown = c13, changedegrees = c23, verbose = FALSE)
    
    expect_that(cd4, equals(c(1390127160.5, 1390127186.5, 1390127187.5, 
        1390127217.5, 1390127249.5, 1390127280.5, 
        1390127281.5, 1390127314.5, 1390127351.5)))
    
    load(file.path(system.file(package = "GENEAclassify"),  "testdata",
            "changeDur_chun02rs2.RData"))
    
    cd5 <- changeTimes(time = Time, intervalseconds = intervalSeconds, 
        changeupdown = changeUpDown, changedegrees = changeDegrees)
    
    expect_that(cd5, equals(c(1356836220.5, 1356837048.5, 1356837172.5,
            1356837260.5, 1356837827.5, 1356838402.5,
            1356839033.5, 1356839067.5, 1356839289.5,
            1356839380.5, 1356839422.5, 1356839807.5,
            1356839819.5)))
    
    rm(list = c("d1", "d2", "c1", "c2", "cd2", "df3", "c13", "c23", "cd4"))
})
