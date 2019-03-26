library(phonR)


### Name: Vowel space area functions
### Title: Calculate the area of a vowel space
### Aliases: convexHullArea vowelMeansPolygonArea
### Keywords: methods

### ** Examples

    data(indoVowels)
    hull.area <- with(indo, convexHullArea(f1, f2, group=subj))
    poly.area <- with(indo, vowelMeansPolygonArea(f1, f2, vowel, 
        poly.order=c("i", "e", "a", "o", "u"), group=subj))



