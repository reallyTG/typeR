library(QuantumClone)


### Name: One_step_clustering
### Title: Cellularity clustering
### Aliases: One_step_clustering
### Keywords: Clonal inference

### ** Examples

Mutations<-QuantumClone::Input_Example
 for(i in 1:2){
 Mutations[[i]]<-cbind(rep(paste("Example_",i,sep=""),times=10),Mutations[[i]])
 colnames(Mutations[[i]])[1]<-"Sample"
}
print("The data should look like this:")
print(head(Mutations[[1]]))

cat("Cluster data: will try to cluster between 3 and 4 clones, with 1 maximum search each time,
      and will use priors from preclustering (e.g. k-medoids on A and AB sites)")
print("The genotype is provided in the list frame, and
          there is no associated data from FREEC to get genotype from.")
print("The computation will run on a single CPU.")
Clustering_output<-One_step_clustering(SNV_list = Mutations,
FREEC_list = NULL,contamination = c(0,0),nclone_range = 3:4,
clone_priors = NULL,prior_weight = NULL ,
Initializations = 1,preclustering = "FLASH", simulated = TRUE,
save_plot = TRUE,ncores=1,output_directory="Example")
print("The data can be accessed by Clustering_output$filtered_data")
print("All plots are now saved in the working directory")





