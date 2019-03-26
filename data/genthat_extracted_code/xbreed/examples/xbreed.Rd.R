library(xbreed)


### Name: xbreed
### Title: Create crossbred population
### Aliases: xbreed

### ** Examples

## Not run: 
##D # # Simulation of a two-way crossbreeding program.
##D # The crossbreeding scheme in this example involves three steps:    
##D #Step 1: Historical population is created.      
##D #Step 2: Two recent populations named as Breed A and B
##D # are created by sampling individuals from historical population.       
##D #Step 3: Breed A and B are crossed.  
##D 
##D #--------------------------------------
##D # # STEP 1: CREATE HISTORICAL POPULATION
##D 
##D # Genome consisted of 3 chromosomes
##D genome<-data.frame(matrix(NA, nrow=3, ncol=6))
##D names(genome)<-c("chr","len","nmrk","mpos","nqtl","qpos")
##D genome$chr<-c(1:3)
##D genome$len<-rep(100,3)	
##D genome$nmrk<-rep(100,3)
##D genome$mpos<-rep('rnd',3)	
##D genome$nqtl<-rep(25,3)
##D genome$qpos<-rep('rnd',3)	
##D genome
##D 
##D historical<-make_hp(hpsize=300
##D ,ng=10,h2=0.25,d2=0.10,phen_var=1
##D ,genome=genome,mutr=5*10**-4,laf=0.5)
##D 
##D # # STEP 2: MAKE BREED A AND B 
##D # BREED A
##D Breed_A_Male_fndrs<-data.frame(number=50,select='rnd') 
##D Breed_A_Female_fndrs<-data.frame(number=50,select='rnd') 
##D 
##D # Selection and matings in Breed A
##D 	# Selection of 50 sires and 50 dam			
##D 	# Selection criteria is "rnd" for both sires and dams
##D  Selection<-data.frame(matrix(NA, nrow=2, ncol=2))
##D  names(Selection)<-c("Number","type")
##D  Selection$Number[1:2]<-c(50,50)	
##D  Selection$type[1:2]<-c("rnd","rnd")	
##D  Selection
##D 
##D Breed_A<-sample_hp(hp_out=historical,Male_founders=
##D Breed_A_Male_fndrs,Female_founders=Breed_A_Female_fndrs,
##D ng=5,Selection=Selection,
##D litter_size=3,Display=TRUE)
##D  
##D # BREED B
##D Breed_B_Male_fndrs<-data.frame(number=50,select="rnd") 
##D Breed_B_Female_fndrs<-data.frame(number=50,select="rnd") 
##D 
##D # Selection and matings in Breed B
##D 	# Selection of 50 sires and 50 dam			
##D 	# Selection criteria is "phen" for both sires and dams
##D 
##D Selection<-data.frame(matrix(NA, nrow=2, ncol=3))
##D names(Selection)<-c("Number","type","Value")
##D Selection$Number[1:2]<-c(50,50)	
##D Selection$type[1:2]<-c("phen","phen")	
##D Selection$Value[1:2]<-c("h","h") 
##D Selection
##D 
##D Breed_B<-sample_hp(hp_out=historical,Male_founders=
##D Breed_B_Male_fndrs,Female_founders=Breed_B_Female_fndrs,
##D ng=5,Selection=Selection,
##D litter_size=3,Display=TRUE)
##D 
##D # # STEP 3: CROSSING BETWEEN BREED A AND B
##D 
##D   # Selection of founders in crossbreeding for Breed A 
##D 		# Selection of 50 sires and 50 dams 
##D          # from last generation of pop in step 2. 			
##D 	# Selection criteria is "rnd" for both sires and dams
##D founder_pop1<-data.frame(matrix(NA, nrow=2, ncol=3))
##D names(founder_pop1)<-c("size","generation","select")
##D founder_pop1[1,]<-c(50,5,"rnd") 
##D founder_pop1[2,]<-c(50,5,"rnd")
##D founder_pop1
##D   
##D # Selection of founders in crossbreeding for Breed B 
##D 	# Selection of 40 sires and 40 dams			
##D 	# Selection criteria is "phen" for sires 
##D 	# Selection criteria is "rnd" for dams
##D 
##D founder_pop2<-data.frame(matrix(NA, nrow=2, ncol=4))
##D names(founder_pop2)<-c("size","generation","select","value")
##D founder_pop2[1,]<-c(40,5,"phen","h") 
##D founder_pop2[2,]<-c(40,5,"rnd","h") # "h" will be ignored as SC is "rnd"
##D founder_pop2
##D 
##D # Selection of animals from founder_pop1 and founder_pop2 to be crossed
##D founder_cross<-data.frame(matrix(NA, nrow=2, ncol=4))
##D names(founder_cross)<-c("pop","size","select","value")
##D founder_cross[1,]<-c("pop1",35,"tbv","h") # Select males from Breed A
##D founder_cross[2,]<-c("pop2",40,"phen","h")  # Select females from Breed B
##D founder_cross
##D 
##D # Selection scheme in Breed A to produce purebred replacement animals 
##D Selection_pop1<-data.frame(matrix(NA, nrow=2, ncol=3))
##D names(Selection_pop1)<-c("Number","type","Value")
##D Selection_pop1$Number[1:2]<-c(70,70)				
##D Selection_pop1$type[1:2]<-c("tbv","tbv")	
##D Selection_pop1$Value[1:2]<-c("h","h")
##D Selection_pop1
##D 
##D # Selection scheme in Breed B to produce purebred replacement animals 
##D Selection_pop2<-data.frame(matrix(NA, nrow=2, ncol=3))
##D names(Selection_pop2)<-c("Number","type","Value")
##D Selection_pop2$Number[1:2]<-c(40,40)				
##D Selection_pop2$type[1:2]<-c("phen","phen")	
##D Selection_pop2$Value[1:2]<-c("h","h")
##D Selection_pop2
##D 
##D # Selection scheme for crossing between A and B
##D Cross_design<-data.frame(matrix(NA, nrow=2, ncol=4))
##D names(Cross_design)<-c("pop","size","select","value")
##D Cross_design[1,]<-c("pop1",50,"phen","h") 
##D Cross_design[2,]<-c("pop2",100,"phen","h")
##D Cross_design
##D 
##D # Save data for crossbred AB
##D output_cross<-data.frame(matrix(NA, nrow=1, ncol=1))
##D output_cross[,1]<-c(1)
##D output_cross
##D 
##D cross_AB<-xbreed(pop1=Breed_A,pop2=Breed_B,founder_pop1=
##D founder_pop1,founder_pop2=founder_pop2,
##D founder_cross=founder_cross,
##D Selection_pop1=Selection_pop1,Selection_pop2=Selection_pop2,
##D Cross_design=Cross_design,ng=2,litter_size=4,
##D saveAt="cross_pop",output_cross=output_cross,Display=TRUE)
## End(Not run)



