library(AIG)


### Name: lisy
### Title: Linear Syllogism Generator
### Aliases: lisy

### ** Examples

#Generate an item with default item set
lisy(seed=10,nclues=4,nspread=6,clone = NULL,incidental='names',linear=FALSE,
    antonym="first",ninfer = 3, direct='ob', Ndist=3,
    dist="mixed",distprob=0.5,itemSet='random',
    items= NULL,scales = NULL)

#Item set
superheroes <- c('Spider man','Super man','Batman','Wolverine',
'Catwoman','Thor','The Shadow','Silver Surfer', 'Flash','Wonder woman',
'Mr. Fantastic', 'Aqua man', "Hawkeye", 'Starfire', 'Venom', "General Zod")

#Antonym
compare <- c("taller","shorter", "older", "younger",
 "smaller", "bigger","stronger", "weaker")

#Generate item with own dataset
lisy(seed=1,nclues=4,nspread=6,clone = NULL,incidental='names',linear=FALSE,
    antonym="first",ninfer = 3, direct='ob',
    Ndist=3, dist="mixed",distprob=0.5,
    itemSet='own',items= superheroes, scales = compare)

#loop through 30 items
run <- NULL
for(i in 1:30){
 run[[i]]<-AIG::lisy(seed=i,nclues=4,nspread=5,clone = 1,incidental='names',linear=TRUE,
                     dist="false",distprob=0.5,itemSet='random',
                     antonym="both",ninfer = 3, direct='of', Ndist=3,
                    items= NULL,scales = NULL)
}



