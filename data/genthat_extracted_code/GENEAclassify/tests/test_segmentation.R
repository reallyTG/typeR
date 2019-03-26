# SVN revision:   
# Date of last change: 2017-08-24
# Last changed by: csweetland
# 
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("segmentation")

###############################################################################

test_that("segmentation", {
    
    set.seed(435524) 
    raw <- matrix(rnorm(700), ncol = 7)
    colnames(raw) <- c("timestamp", "x", "y", "z", "light", "button", "temperature")
    raw[, "timestamp"] <- seq(from = 1, to = 10, length.out = 100)
    temp <- list(Data = matrix(rnorm(40), ncol = 4), 
        UpDown = rnorm(10), 
        Degrees = sample(-90:90, 10),
        Time = 1:10, 
        Light = runif(10),
        Temp = rep(20, 10),
        Magnitude = runif(10), 
        Serial = "012345",
        RawData = raw,
        Freq = 100)
    
    t1 <- segmentation(temp,method="longrun", plot.it = FALSE, verbose = FALSE)
    
    s1 <- structure(
        list(Serial.Number = "012345",
            Start.Time = 1L, 
            Segment.Start.Time = "00:00:01", 
            Segment.Duration = 9, 
            UpDown.median = -0.155915789639467, 
            UpDown.mad = 0.493207773676405, 
            Degrees.median = -12.5, 
            Degrees.mad = 94.8864, 
            UpDown.mean = -0.0539059856280429, 
            UpDown.var = 0.324541548831408, 
            UpDown.sd = 0.569685482377257, 
            Degrees.mean = 2.9, 
            Degrees.var = 3897.87777777778, 
            Degrees.sd = 62.4329862955295, 
            Magnitude.mean = 0.528522184165195, 
            Light.mean = 0.437376559432596, 
            Light.max = 0.852678117807955, 
            Temp.mean = 20, 
            Step1.count = 0, 
            Step1.sd = NA_real_, 
            Principal.Frequency.median = NA_real_, 
            Principal.Frequency.mad = NA_real_, 
            Principal.Frequency.ratio = NaN), 
        .Names = c("Serial.Number", 
            "Start.Time", "Segment.Start.Time", "Segment.Duration", "UpDown.median", 
            "UpDown.mad", "Degrees.median", "Degrees.mad", "UpDown.mean", 
            "UpDown.var", "UpDown.sd", "Degrees.mean", "Degrees.var", "Degrees.sd", 
            "Magnitude.mean", "Light.mean", "Light.max", "Temp.mean", "Step.count", 
            "Step.sd", "Principal.Frequency.median", "Principal.Frequency.mad", 
            "Principal.Frequency.ratio"), 
            row.names = c(NA, -1L), class = "data.frame")
    
    expect_that(t1, equals(s1))
    
    t2 <- segmentation(temp, datacols = "Degrees.skew", method="longrun",
        filter = FALSE, plot.it = FALSE, verbose = FALSE)
    
    s2 <- structure(
        list(
            Serial.Number = "012345", 
            Start.Time = 1L, 
            Segment.Start.Time = "00:00:01", 
            Segment.Duration = 9, 
            UpDown.median = -0.155915789639467, 
            UpDown.mad = 0.493207773676405, 
            Degrees.median = -12.5, 
            Degrees.mad = 94.8864, 
            Degrees.skew = 0.036750826425674), 
        .Names = c("Serial.Number", 
            "Start.Time", "Segment.Start.Time", "Segment.Duration", "UpDown.median", 
            "UpDown.mad", "Degrees.median", "Degrees.mad", "Degrees.skew"), 
        row.names = 1L, class = "data.frame")
    
    expect_that(t2, equals(s2))
    
    rm(list = c("t1", "t2", "s1"))
})
