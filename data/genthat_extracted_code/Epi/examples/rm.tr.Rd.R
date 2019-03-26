library(Epi)


### Name: rm.tr
### Title: Remove transitions from a Lexis object.
### Aliases: rm.tr
### Keywords: manip

### ** Examples

data(DMlate)
dml <- Lexis( entry = list(Per=dodm, Age=dodm-dobth, DMdur=0 ),
               exit = list(Per=dox),
        exit.status = factor(!is.na(dodth),labels=c("DM","Dead")),
               data = DMlate )

# A small subset for illustration
dml <- subset( dml, lex.id %in% c(13,15,20,28,40) )

# Cut the follow-up at start of insulin therapy
dmi <- cutLexis( dml, cut = dml$doins,
                      pre = "DM",
                new.state = "Ins" )[,1:10]

# How does it look?
dmi

# Remove all transitions DM -> Ins
rm.tr( dmi, "DM", "Ins" )



