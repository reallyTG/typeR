library(psych)


### Name: msq
### Title: 75 mood items from the Motivational State Questionnaire for 3896
###   participants
### Aliases: msq
### Keywords: datasets

### ** Examples

data(msq)
if(FALSE){ #not run in the interests of time
#basic descriptive statistics
describe(msq)
}
#score them for 20 short scales -- note that these have item overlap
#The first 2 are from Thayer
#The next 2 are classic positive and negative affect
#The next 9 are circumplex scales
#the last 7 are msq estimates of PANASX scales (missing some items)
keys.list <- list(
EA = c("active", "energetic", "vigorous", "wakeful", "wide.awake", "full.of.pep",
       "lively", "-sleepy", "-tired", "-drowsy"),
TA =c("intense", "jittery", "fearful", "tense", "clutched.up", "-quiet", "-still", 
       "-placid", "-calm", "-at.rest") ,
PA =c("active", "excited", "strong", "inspired", "determined", "attentive", 
          "interested", "enthusiastic", "proud", "alert"),
NAf =c("jittery", "nervous", "scared", "afraid", "guilty", "ashamed", "distressed",  
         "upset", "hostile", "irritable" ),
HAct = c("active", "aroused", "surprised", "intense", "astonished"),
aPA = c("elated", "excited", "enthusiastic", "lively"),
uNA = c("calm", "serene", "relaxed", "at.rest", "content", "at.ease"),
pa = c("happy", "warmhearted", "pleased", "cheerful", "delighted" ),
LAct = c("quiet", "inactive", "idle", "still", "tranquil"),
uPA =c( "dull", "bored", "sluggish", "tired", "drowsy"),
naf = c( "sad", "blue", "unhappy", "gloomy", "grouchy"),
aNA = c("jittery", "anxious", "nervous", "fearful", "distressed"),
Fear = c("afraid" , "scared" , "nervous" , "jittery" ) ,
Hostility = c("angry" ,  "hostile", "irritable", "scornful" ), 
Guilt = c("guilty" , "ashamed" ),
Sadness = c( "sad"  , "blue" , "lonely",  "alone" ),
Joviality =c("happy","delighted", "cheerful", "excited", "enthusiastic", "lively", "energetic"), 
Self.Assurance=c( "proud","strong" , "confident" , "-fearful" ),
Attentiveness = c("alert" , "determined" , "attentive" )
#, acquiscence = c("sleepy" ,  "wakeful" ,  "relaxed","tense")   
#dropped because it has a negative alpha and throws warnings
   )
       
msq.scores <- scoreItems(keys.list,msq)

#show a circumplex structure for the non-overlapping items
fcirc <- fa(msq.scores$scores[,5:12],2)  
fa.plot(fcirc,labels=colnames(msq.scores$scores)[5:12])

#now, find the correlations corrected for item overlap
msq.overlap <- scoreOverlap(keys.list,msq)
f2 <- fa(msq.overlap$cor,2)
fa.plot(f2,labels=colnames(msq.overlap$cor),title="2 dimensions of affect, corrected for overlap")
if(FALSE) {
#extend this solution to EA/TA  NA/PA space
fe  <- fa.extension(cor(msq.scores$scores[,5:12],msq.scores$scores[,1:4]),fcirc)
fa.diagram(fcirc,fe=fe,main="Extending the circumplex structure to  EA/TA and PA/NA ")

#show the 2 dimensional structure
f2 <- fa(msq[1:72],2)
fa.plot(f2,labels=colnames(msq)[1:72],title="2 dimensions of affect at the item level",cex=.5)

#sort them by polar coordinates
round(polar(f2),2)
}
            




