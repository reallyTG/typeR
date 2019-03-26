library(psych)


### Name: msqR
### Title: 75 mood items from the Motivational State Questionnaire for 3032
###   unique participants
### Aliases: msqR
### Keywords: datasets

### ** Examples

data(msqR)
table(msqR$form,msqR$time) #which forms
table(msqR$study,msqR$drug) #Drug studies
table(msqR$study,msqR$film) #Film studies
table(msqR$study,msqR$TOD) #To examine time of day


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
Attentiveness = c("alert" , "determined" , "attentive" ))

#acquiscence = c("sleepy" ,  "wakeful" ,  "relaxed","tense")
   
       
msq.scores <- scoreItems(keys.list,msqR)

#show a circumplex structure for the non-overlapping items
fcirc <- fa(msq.scores$scores[,5:12],2)  
fa.plot(fcirc,labels=colnames(msq.scores$scores)[5:12])

#now, find the correlations corrected for item overlap
msq.overlap <- scoreOverlap(keys.list,msqR)
f2 <- fa(msq.overlap$cor,2)
fa.plot(f2,labels=colnames(msq.overlap$cor),title="2 dimensions of affect, corrected for overlap")
if(FALSE) {
#extend this solution to EA/TA  NA/PA space
fe  <- fa.extension(cor(msq.scores$scores[,5:12],msq.scores$scores[,1:4]),fcirc)
fa.diagram(fcirc,fe=fe,main="Extending the circumplex structure to  EA/TA and PA/NA ")

#show the 2 dimensional structure
f2 <- fa(msqR[1:72],2)
fa.plot(f2,labels=colnames(msqR)[1:72],title="2 dimensions of affect at the item level")

#sort them by polar coordinates
round(polar(f2),2)
}
#the msqR and sai data sets have 10 overlapping items which can be used for
#testRetest analysis.  We need to specify the keys, and then choose the appropriate
#data sets  
sai.msq.keys <- list(pos =c( "at.ease" ,  "calm" , "confident", "content","relaxed"),
  neg = c("anxious", "jittery", "nervous" ,"tense"  ,   "upset"),
  anx = c("anxious", "jittery", "nervous" ,"tense", "upset","-at.ease" ,  "-calm" ,
  "-confident", "-content","-relaxed"))
if(FALSE) {
select <- selectFromKeys(sai.msq.keys$anx)
#The following is useful for examining test retest reliabilities
msq.control <- subset(msqR, msqR$study %in% c("Cart", "Fast", "SHED", "SHOP"))
msq.film <- subset(msqR,(msqR$study %in% c("FIAT", "FILM","FLAT","MIXX","XRAY")
    & (msqR$time < 3) )) 

msq.film[((msq.film$study == "FLAT") & (msq.film$time ==3)) ,] <- NA 
msq.drug <- subset(msqR,(msqR$study %in% c("AGES","SALT", "VALE", "XRAY"))
   &(msqR$time < 3))

msq.day <- subset(msqR,(msqR$study %in% c("SAM", "RIM")))

}




