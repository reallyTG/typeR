library(sem)


### Name: pathDiagram
### Title: Draw Path Diagram
### Aliases: pathDiagram pathDiagram.sem pathDiagram.semmod math
### Keywords: dplot models

### ** Examples

	if (interactive()) {
# The Duncan, Haller, and Portes Peer-Influences Model

R.DHP <- readMoments(diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
                "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp"),
                text="
    .6247                                                              
    .3269  .3669                                                        
    .4216  .3275  .6404                                      
    .2137  .2742  .1124  .0839                                
    .4105  .4043  .2903  .2598  .1839                          
    .3240  .4047  .3054  .2786  .0489  .2220                    
    .2930  .2407  .4105  .3607  .0186  .1861  .2707              
    .2995  .2863  .5191  .5007  .0782  .3355  .2302  .2950        
    .0760  .0702  .2784  .1988  .1147  .1021  .0931 -.0438  .2087  
")

model.dhp <- specifyModel(text="
    RParAsp  -> RGenAsp, gam11,  NA
    RIQ      -> RGenAsp, gam12,  NA
    RSES     -> RGenAsp, gam13,  NA
    FSES     -> RGenAsp, gam14,  NA
    RSES     -> FGenAsp, gam23,  NA
    FSES     -> FGenAsp, gam24,  NA
    FIQ      -> FGenAsp, gam25,  NA
    FParAsp  -> FGenAsp, gam26,  NA
    FGenAsp  -> RGenAsp, beta12, NA
    RGenAsp  -> FGenAsp, beta21, NA
    RGenAsp  -> ROccAsp,  NA,       1
    RGenAsp  -> REdAsp,  lam21,  NA
    FGenAsp  -> FOccAsp,  NA,       1
    FGenAsp  -> FEdAsp,  lam42,  NA
    RGenAsp <-> RGenAsp, ps11,   NA
    FGenAsp <-> FGenAsp, ps22,   NA
    RGenAsp <-> FGenAsp, ps12,   NA
    ROccAsp <-> ROccAsp, theta1, NA
    REdAsp  <-> REdAsp,  theta2, NA
    FOccAsp <-> FOccAsp, theta3, NA
    FEdAsp  <-> FEdAsp,  theta4, NA
")

sem.dhp <- sem(model.dhp, R.DHP, 329,
    fixed.x=c("RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp"))
    
pathDiagram(sem.dhp, min.rank="RIQ, RSES, RParAsp, FParAsp, FSES, FIQ", 
                     max.rank="ROccAsp, REdAsp, FEdAsp, FOccAsp",
                     same.rank="RGenAsp, FGenAsp",
                     edge.labels="values")
    
pathDiagram(model.dhp,
    obs.variables=c("RParAsp", "RIQ", "RSES", "FSES", "FIQ", 
        "FParAsp", "ROccAsp", "REdAsp", "FOccAsp", "FEdAsp"),
    style="traditional", 
    node.colors=c("pink", "lightblue", "lightgreen"),
    min.rank="RIQ, RSES, RParAsp, FParAsp, FSES, FIQ",
    max.rank="ROccAsp, REdAsp, FEdAsp, FOccAsp",
    same.rank="RGenAsp, FGenAsp",
    var.labels=c(RParAsp="Respondent Parental Aspiration", 
        RIQ="Respondent IQ",
        RSES="Respondent SES",
        FSES="Friend SES",
        FIQ="Friend IQ",
        FParAsp="Friend Parental Aspiration",
        ROccAsp="Respondent Occupational Aspiration",
        REdAsp="Respondent Educational Aspiration",
        RGenAsp="Respondent General Aspiration",
        FOccAsp="Friend Occupational Aspiration",
        FEdAsp="Friend Educational Aspiration",
        FGenAsp="Friend General Aspiration",
        math(c(RGenAsp.error="xi_{1}",
        FGenAsp.error="xi_{2}",
        ROccAsp.error="epsilon_{1}",
        REdAsp.error="epsilon_{2}",
        FOccAsp.error="epsilon_{3}",
        FEdAsp.error="epsilon_{4}"))),
    par.labels=math(c(gam11="gamma_{11}",
        gam12="gamma_{12}",
        gam13="gamma_{13}",
        gam14="gamma_{14}",
        gam23="gamma_{23}",
        gam24="gamma_{24}",
        gam25="gamma_{25}",
        gam26="gamma_{26}",
        beta12="beta_{12}",
        beta21="beta_{21}",
        lam21="lambda_{21}",
        lam42="lambda_{42}",
        ps11="psi_{11}",
        ps22="psi_{22}",
        ps12="psi_{12}",
        theta1="theta_{1}",
        theta2="theta_{2}",
        theta3="theta_{3}",
        theta4="theta_{4}")))
        
    # the following example contributed by Michael Friendly:
    
union <- readMoments(diag=TRUE,
    names=c('y1', 'y2', 'y3', 'x1', 'x2'), text="
14.610
-5.250  11.017
-8.057  11.087   31.971
-0.482   0.677    1.559   1.021
-18.857  17.861   28.250   7.139  215.662
")

union.mod <- specifyEquations(covs=c("x1, x2"), text="
y1 = gam12*x2
y2 = beta21*y1 + gam22*x2
y3 = beta31*y1 + beta32*y2 + gam31*x1
")

union.sem <- sem(union.mod, union, N=173)

dot <- pathDiagram(union.sem, style="traditional",  
    ignore.double=FALSE, error.nodes=FALSE,
    edge.labels="values", 
    min.rank=c("Years", "Age"), 
    max.rank=c("Sentiment", "Sentiment.error"),
    same.rank=c("Deference, Deference.error", "Activism, Activism.error"),
    variables=c("Deference", "Activism", "Sentiment", "Years", "Age"),
    edge.colors=c("black", "red"),
    node.colors = c("pink", "lightblue"))

cat(paste(dot, collapse="\n")) # dot commands

    }



