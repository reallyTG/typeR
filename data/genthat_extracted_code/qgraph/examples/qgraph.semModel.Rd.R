library(qgraph)


### Name: qgraph.semModel
### Title: qgraph: SEM model pathdiagram
### Aliases: qgraph.semModel

### ** Examples

## Not run: 
##D 
##D require('sem')
##D 
##D # This example is taken from the examples of the sem function. 
##D # Only names were changed to better suit the path diagram.
##D 
##D # ----------------------- Thurstone data ---------------------------------------
##D #  Second-order confirmatory factor analysis, from the SAS manual for PROC CALIS
##D 
##D R.thur <- readMoments(diag=FALSE, names=c('Sen','Voc',
##D         'SC','FL','4LW','Suf',
##D         'LS','Ped', 'LG'))
##D     .828                                              
##D     .776   .779                                        
##D     .439   .493    .46                                 
##D     .432   .464    .425   .674                           
##D     .447   .489    .443   .59    .541                    
##D     .447   .432    .401   .381    .402   .288              
##D     .541   .537    .534   .35    .367   .32   .555        
##D     .38   .358    .359   .424    .446   .325   .598   .452  
##D             
##D model.thur <- specifyModel()
##D     F1 -> Sen,               *l11, NA
##D     F1 -> Voc,               *l21, NA
##D     F1 -> SC,                *l31, NA
##D     F2 -> FL,                *l41, NA
##D     F2 -> 4LW,               *l52, NA
##D     F2 -> Suf,               *l62, NA
##D     F3 -> LS,                *l73, NA
##D     F3 -> Ped,               *l83, NA
##D     F3 -> LG,                *l93, NA
##D     F4 -> F1,                *g1,  NA
##D     F4 -> F2,                *g2,  NA
##D     F4 -> F3,                *g3,  NA 
##D     Sen <-> Sen,             q*1,   NA
##D     Voc<-> Voc,              q*2,   NA
##D     SC <-> SC,               q*3,   NA
##D     FL <-> FL,               q*4,   NA
##D     4LW <-> 4LW,             q*5,   NA
##D     Suf<-> Suf,              q*6,   NA
##D     LS <-> LS,               q*7,   NA
##D     Ped<-> Ped,              q*8,   NA
##D     LG <-> LG,               q*9,   NA
##D     F1 <-> F1,               NA,     1
##D     F2 <-> F2,               NA,     1
##D     F3 <-> F3,               NA,     1
##D     F4 <-> F4,               NA,     1
##D 
##D 
##D 
##D # Run qgraph:
##D qgraph(model.thur)
##D 
##D # Tree layout:
##D qgraph(model.thur,layout="tree",manifest=c('Sen','Voc','SC','FL','4LW','Suf','LS','Ped', 'LG'))
##D 
## End(Not run)


