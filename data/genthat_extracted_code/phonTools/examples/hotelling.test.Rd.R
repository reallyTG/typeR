library(phonTools)


### Name: hotelling.test
### Title: Hotelling's T2 Test
### Aliases: hotelling.test print.hotelling.test

### ** Examples

## load Peterson & Barney data
data (pb52)

## separate the Peterson & Barney vowels by speaker
## gender and age (child vs. adult)
men = pb52[pb52$sex == 'm' & pb52$type == 'm',]
women = pb52[pb52$sex == 'f' & pb52$type == 'w',]
boys = pb52[pb52$sex == 'm' & pb52$type == 'c',]
girls = pb52[pb52$sex == 'f' & pb52$type == 'c',]

## fit 4 separate models which predict F1 frequency 
## on the basis of vowel category. 
men = rcr (f1 ~ vowel, men$speaker, men)
women = rcr (f1 ~ vowel, women$speaker, women)
boys = rcr (f1 ~ vowel, boys$speaker, boys)
girls = rcr (f1 ~ vowel, girls$speaker, girls)

## A Hotelling T2 test indicates that there are 
## significant differences in F1 frequency 
## based on vowel category between males and females
hotelling.test (men$coefficients, women$coefficients)

## but no significant differences based on the same 
## criteria between boys and girls.
hotelling.test (boys$coefficients, girls$coefficients)



