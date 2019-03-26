library(netdiffuseR)


### Name: survey_to_diffnet
### Title: Convert survey-like data and edgelists to a 'diffnet' object
### Aliases: survey_to_diffnet edgelist_to_diffnet

### ** Examples

# Loading a fake survey (data frame)
data(fakesurvey)

# Diffnet object keeping isolated vertices ----------------------------------
dn1 <- survey_to_diffnet(fakesurvey, "id", c("net1", "net2", "net3"), "toa",
   "group", keep.isolates=TRUE)

# Diffnet object NOT keeping isolated vertices
dn2 <- survey_to_diffnet(fakesurvey, "id", c("net1", "net2", "net3"), "toa",
   "group", keep.isolates=FALSE)

# dn1 has an extra vertex than dn2
dn1
dn2

# Loading a longitudinal survey data (two waves) ----------------------------
data(fakesurveyDyn)

groupvar <- "group"
x <- survey_to_diffnet(
   fakesurveyDyn, "id", c("net1", "net2", "net3"), "toa", "group" ,
   timevar = "time", keep.isolates = TRUE, warn.coercion=FALSE)

plot_diffnet(x, vertex.label = rownames(x))

# Reproducing medInnovationsDiffNet object ----------------------------------
data(medInnovations)

# What are the netvars
netvars <- names(medInnovations)[grepl("^net", names(medInnovations))]

medInnovationsDiffNet2 <- survey_to_diffnet(
   medInnovations,
   "id", netvars, "toa", "city",
   warn.coercion=FALSE)

medInnovationsDiffNet2

# Comparing with the package's version
all(diffnet.toa(medInnovationsDiffNet2) == diffnet.toa(medInnovationsDiffNet)) #TRUE
all(
   diffnet.attrs(medInnovationsDiffNet2, as.df = TRUE) ==
   diffnet.attrs(medInnovationsDiffNet, as.df = TRUE),
   na.rm=TRUE) #TRUE





