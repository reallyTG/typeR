library(sem)


### Name: fscores
### Title: Factor Scores for Latent Variables
### Aliases: fscores fscores.sem fscores.msem
### Keywords: models manip

### ** Examples


# In the first example, readMoments() and specifyModel() read from the
# input stream. This example cannot be executed via example() but can be entered
# at the command prompt. The example is repeated using file input;
# this example can be executed via example(). 
	   ## Not run: 
##D 
##D S.wh <- readMoments(names=c('Anomia67','Powerless67','Anomia71',
##D                                     'Powerless71','Education','SEI'))
##D    11.834                                    
##D     6.947    9.364                            
##D     6.819    5.091   12.532                    
##D     4.783    5.028    7.495    9.986            
##D    -3.839   -3.889   -3.841   -3.625   9.610     
##D   -21.899  -18.831  -21.748  -18.775  35.522  450.288
##D 
##D # This model in the SAS manual for PROC CALIS
##D 
##D model.wh.1 <- specifyModel()
##D     Alienation67   ->  Anomia67,      NA,     1
##D     Alienation67   ->  Powerless67,   NA,     0.833
##D     Alienation71   ->  Anomia71,      NA,     1
##D     Alienation71   ->  Powerless71,   NA,     0.833 
##D     SES            ->  Education,     NA,     1     
##D     SES            ->  SEI,           lamb,   NA
##D     SES            ->  Alienation67,  gam1,   NA
##D     Alienation67   ->  Alienation71,  beta,   NA
##D     SES            ->  Alienation71,  gam2,   NA
##D     Anomia67       <-> Anomia67,      the1,   NA
##D     Anomia71       <-> Anomia71,      the1,   NA
##D     Powerless67    <-> Powerless67,   the2,   NA
##D     Powerless71    <-> Powerless71,   the2,   NA
##D     Education      <-> Education,     the3,   NA
##D     SEI            <-> SEI,           the4,   NA
##D     Anomia67       <-> Anomia71,      the5,   NA
##D     Powerless67    <-> Powerless71,   the5,   NA
##D     Alienation67   <-> Alienation67,  psi1,   NA
##D     Alienation71   <-> Alienation71,  psi2,   NA
##D     SES            <-> SES,           phi,    NA
##D     
##D                         
##D sem.wh.1 <- sem(model.wh.1, S.wh, 932)
##D 
##D fscores(sem.wh.1)
##D    
## End(Not run)

# The following example can be executed via example():

etc <- system.file(package="sem", "etc") # path to data and model files
   
(S.wh <- readMoments(file=file.path(etc, "S-Wheaton.txt"),
					names=c('Anomia67','Powerless67','Anomia71',
                            'Powerless71','Education','SEI')))
(model.wh.1 <- specifyModel(file=file.path(etc, "model-Wheaton-1.txt")))        
(sem.wh.1 <- sem(model.wh.1, S.wh, 932))
fscores(sem.wh.1)



