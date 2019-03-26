library(multxpert)


### Name: pargateadjp
### Title: Multistage parallel gatekeeping procedures: Adjusted p-values
### Aliases: pargateadjp
### Keywords: procedure p -value

### ** Examples


# Consider a clinical trial with two families of null hypotheses

# Family 1: Primary null hypotheses (one-sided p-values)
# H1 (Endpoint 1), p1=0.0082
# H2 (Endpoint 2), p2=0.0174

# Family 2: Secondary null hypotheses (one-sided p-values)
# H3 (Endpoint 3), p3=0.0042
# H4 (Endpoint 4), p4=0.0180

# Define family label and raw p-values in Family 1
label1<-"Primary endpoints"
rawp1<-c(0.0082,0.0174)

# Define family label and raw p-values in Family 2
label2<-"Secondary endpoints"
rawp2<-c(0.0042,0.0180)

# Independence condition is imposed (Families 1 and 2 are tested
# sequentually from first to last and thus adjusted p-values 
# in Family 1 do not depend on inferences in Family 2)
independence<-TRUE

# Define a two-stage parallel gatekeeping procedure which
# utilizes the truncated Holm procedure in Family 1 (truncation
# parameter=0.5) and regular Holm procedure in Family 2 (truncation
# parameter=1)

# Create a list of gatekeeping procedure parameters
family1<-list(label=label1, rawp=rawp1, proc="Holm", procpar=0.5)
family2<-list(label=label2, rawp=rawp2, proc="Holm", procpar=1)
gateproc<-list(family1,family2)

# Compute adjusted p-values
pargateadjp(gateproc, independence)

# Generate decision rules using a one-sided alpha=0.025
pargateadjp(gateproc, independence, alpha=0.025, printDecisionRules=TRUE)





