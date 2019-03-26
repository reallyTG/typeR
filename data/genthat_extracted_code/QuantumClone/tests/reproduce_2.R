### Source code to reproduce the filtering pipeline

strcount <- function(x, pattern='', split=''){
  unlist(lapply(strsplit(x, split),function(z) na.omit(length(grep(pattern, z)))))
}

### Create stringent dataset
QuantumCat_stringent<-function(number_of_clones = 6,number_of_mutations = 200,
                               ploidy = "AB",depth = 100,
                               contamination = c(0.3,0.4),min_depth = 50){
  if(depth<min_depth){
    error("The depth is lower than the minimal depth")
  }
  variants<-QuantumCat(number_of_clones = number_of_clones,number_of_mutations = number_of_mutations,
                       ploidy = ploidy,depth = depth,number_of_samples= 2,
                       contamination = contamination)
  
  test<-{variants[[1]]$Depth<min_depth} | {variants[[2]]$Depth < min_depth}
  
  while(sum(test)>0){ ### Check that all variants are above 50X depth
    for(i in 1:2){
      sparetest<-variants[[i]]$Depth<min_depth
      variants[[i]]$Depth[sparetest]<-rnbinom(n=sum(sparetest),size = 4.331601,mu = depth)
      variants[[i]]$Alt[sparetest]<-rbinom(n = sum(sparetest),
                                           size=variants[[i]]$Depth[sparetest],
                                           prob= variants[[i]]$Freq[sparetest]/100
      )
      
    }
    test<-{variants[[1]]$Depth<min_depth} | {variants[[2]]$Depth < min_depth}
  }
  return(variants)
}

QuantumCat_permissive<-function(fromQuantumCat,number_of_mutations = 200,
                                ploidy = "AB",depth = 100,
                                contamination = c(0.3,0.4),max_depth = 50, min_depth = 30){
  if(depth<min_depth | max_depth < min_depth){
    error("Depth error")
  }
  clones<-1:max(fromQuantumCat[[1]]$Chr) # retrieve clones
  
  # Now retrieve cellularity of each clone:
  cells<-list()
  variants<-list()
  chr<-sample(1:max(fromQuantumCat[[1]]$Chr),size = number_of_mutations,
              replace = TRUE)
  Start<-(1:number_of_mutations)+nrow(fromQuantumCat[[1]])
  for(i in 1:2){
    cells[[i]]<-sapply(clones,function(z){
      fromQuantumCat[[1]]$Cellularit[fromQuantumCat[[1]]$Chr==z][1]
    }
    )
    variants[[i]]<-data.frame(Chr = chr,Start = Start,
                              Cellularit = cells[[i]][chr],
                              Genotype = rep(c("AB","AAB","AABB"),times = c(round(number_of_mutations/4),
                                                                            round(number_of_mutations/2),
                                                                            round(number_of_mutations/4)
                              )),
                              number_of_copies = c(rep(1,times = round(number_of_mutations/4)),
                                                   sample(1:2,size = round(3*number_of_mutations/4),replace = TRUE)
                              ),
                              Depth  = rnbinom(n=number_of_mutations,size = 4.331601,mu = depth)
    )
    variants[[i]]$Frequency<-variants[[i]]$Cellularit*
      variants[[i]]$number_of_copies/(strcount(as.character(variants[[i]]$Genotype)))*
      (1-contamination[i])
    
    variants[[i]]$Alt<-rbinom(n = number_of_mutations,
                              size=variants[[i]]$Depth,
                              prob= variants[[i]]$Freq/100
    )
  }
  
  
  
  test<-{variants[[1]]$Depth<min_depth} | {variants[[2]]$Depth < min_depth} | 
  {variants[[1]]$Depth>max_depth & variants[[1]]$Genotype == "AB"} | 
  {variants[[2]]$Depth > max_depth  & variants[[2]]$Genotype == "AB"}
  while(sum(test)>0){ ### Check that all variants are above 50X depth
    for(i in 1:2){
      sparetest<-variants[[i]]$Depth<min_depth | {variants[[i]]$Depth > max_depth  & variants[[i]]$Genotype == "AB"} 
      variants[[i]]$Depth[sparetest]<-rnbinom(n=sum(sparetest),size = 4.331601,mu = depth)
      variants[[i]]$Alt[sparetest]<-rbinom(n = sum(sparetest),
                                           size=variants[[i]]$Depth[sparetest],
                                           prob= variants[[i]]$Freq[sparetest]/100
      )
      
    }
    test<-{variants[[1]]$Depth<min_depth} | {variants[[2]]$Depth < min_depth} | 
    {variants[[1]]$Depth>max_depth & variants[[1]]$Genotype == "AB"} | 
    {variants[[2]]$Depth > max_depth  & variants[[2]]$Genotype == "AB"}
    
  }
  return(variants)
}


#### Create pipelines:
# Starting with standard
paper_pipeline<- function(filtered,
                          permissive,
                          drivers_id,
                          contamination = c(0.3,0.4)
                          ){
  clustering<-One_step_clustering(SNV_list = filtered,
                                  contamination = contamination,
                                  nclone_range = 2:10,
                                  Init =  2,ncores = 2,
                                  save_plot = FALSE
  )
  
  ext<-list()
  for(i in 1:length(filtered)){
    
    ext[[i]]<-permissive[[i]][drivers_id[drivers_id>max(filtered[[1]]$Start)]-max(filtered[[1]]$Start),]
    #print(drivers_l[[i]])
  }
  
  clustering$driver_info<-Probability.to.belong.to.clone(SNV_list = ext,
                                                         clone_prevalence = clustering$EM.output$centers,
                                                         contamination = contamination,
                                                         clone_weights= clustering$EM.output$weights)
  ### Hard clustering
  ### adding a posteriori clustered data
  for(i in 1:length(filtered)){
    clustering$filtered.data[[i]]<-rbind(clustering$filtered.data[[i]],
                                         cbind(clustering$driver_info$filtered_data[[i]],
                                               ext[[i]][,c("Cellularit","number_of_copies","Frequency")])
                                         )
  }
  clustering$cluster<-c(clustering$cluster,clustering$driver_info$cluster)
  ### adding data from a posteriori clustering

  return(clustering)
  
}

# Creating extended pipeline:

extended<- function(filtered,
                    permissive,
                    drivers_id,
                    contamination = c(0.3,0.4)){
  input<-list()
  for(i in 1:length(permissive)){
    input[[i]]<-rbind(filtered[[i]],
                      permissive[[i]][drivers_id[drivers_id>max(filtered[[1]]$Start)]-max(filtered[[1]]$Start),])
    
  }
  clustering<-One_step_clustering(SNV_list = input,
                                  contamination = contamination,
                                  nclone_range = 2:10,
                                  Init =  2,ncores = 2,
                                  save_plot = FALSE
  )
  
  clustering$driver_clust<-clustering$cluster[clustering$filtered.data[[1]]$Start %in% drivers_id]
  return(clustering)
}

All<-function(filtered,
              permissive,
              drivers_id,
              contamination = c(0.3,0.4)){
  input<-list()
  for(i in 1:length(permissive)){
    input[[i]]<-rbind(filtered[[i]],
                      permissive[[i]])
    
  }
  clustering<-One_step_clustering(SNV_list = input,
                                  contamination = contamination,
                                  nclone_range = 2:10,
                                  Init =  2,ncores = 4,
                                  save_plot = FALSE
  )
  
  ### keep only 215 meaningful
  keep<-clustering$filtered.data[[1]]$Start %in% c(filtered[[1]]$Start,drivers_id)
  for(s in 1:2){
    clustering$filtered.data[[s]]<-clustering$filtered.data[[s]][keep,]
  }
  clustering$cluster<-clustering$cluster[keep]
  clustering$driver_clust<-clustering$cluster[clustering$filtered.data[[1]]$Start %in% drivers_id]
  return(clustering)
}

### Now we are going to compare quality of clustering: NMI, maximal distance to closest clone, number of clusters,
### average error and maximal error for drivers

compare_qual<-function(paper,
                       extended,
                       all,
                       drivers_id){
  
  # NMI
  NMI<-c(Compute_NMI(paper),
         Compute_NMI(extended),
         Compute_NMI(all)
  )
  
  cellularities<-lapply(X = paper$filtered.data,FUN = function(df){
    sapply(unique(df$Chr),FUN = function(ch){
      df$Cellularit[df$Chr==ch][1]/100
    }
    ) 
  }
  )

  #maximal distance to closest clone
  Max.Distance.to.clone<-c(
    MaxDistance(cellularit = cellularities, cluster_cells = paper$EM.output$normalized.centers),
    MaxDistance(cellularit = cellularities, cluster_cells = extended$EM.output$normalized.centers),
    MaxDistance(cellularit = cellularities, cluster_cells = all$EM.output$normalized.centers)
  )
  #number clusters
  
  nclusters<-c(length(paper$EM.output$centers[[1]]),
               length(extended$EM.output$centers[[1]]),
               length(all$EM.output$centers[[1]])
  )
  # average and max error for drivers
  # TODO:
  # * Create test.driver that gets cellularity of drivers
  # * Create retrieve.driver that retrieves true clone of drivers (also get 5 "easy" drivers)
  test.driver<-paper$filtered.data[[1]]$Start %in% drivers_id
  pap.err<-sqrt({
    cellularities[[1]][paper$filtered.data[[1]]$Chr[test.driver]]-
      paper$EM.output$normalized.centers[[1]][paper$cluster[test.driver]]}**2+
      {
        cellularities[[2]][paper$filtered.data[[1]]$Chr[test.driver]]-
          paper$EM.output$normalized.centers[[2]][paper$cluster[test.driver]]}**2
  )

  pap.mut.err<-sqrt({
    paper$filtered.data[[1]]$Cellularit/100-
      paper$EM.output$normalized.centers[[1]][paper$cluster]}**2+
      {
        paper$filtered.data[[2]]$Cellularit/100-
          paper$EM.output$normalized.centers[[2]][paper$cluster]}**2
  )

  ext.test<-cnum(extended$filtered.data[[1]]$Start) %in% cnum(drivers_id)
  ext.Chr<-extended$filtered.data[[1]]$Chr[ext.test]
  ext.clust<-extended$cluster[ext.test]
  

  ext.err<-sqrt({cellularities[[1]][ext.Chr]-
      extended$EM.output$normalized.centers[[1]][ext.clust]}**2+
      {cellularities[[2]][ext.Chr]-
          extended$EM.output$normalized.centers[[2]][ext.clust]}**2
  )
  
  ext.mut.err<-sqrt({extended$filtered.data[[1]]$Cellularit/100-
      extended$EM.output$normalized.centers[[1]][extended$cluster]}**2+
      {extended$filtered.dat[[2]]$Cellularit/100-
          extended$EM.output$normalized.centers[[2]][extended$cluster]}**2
  )
  all.test<-cnum(all$filtered.data[[1]]$Start) %in% cnum(drivers_id)
  all.Chr<-all$filtered.data[[1]]$Chr[all.test]
  all.clust<-all$cluster[all.test]
  
  
  all.err<-sqrt({cellularities[[1]][all.Chr]-
      all$EM.output$normalized.centers[[1]][all.clust]}**2+
      {cellularities[[2]][all.Chr]-
          all$EM.output$normalized.centers[[2]][all.clust]}**2
  )
  all.mut.err<-sqrt({all$filtered.data[[1]]$Cellularit/100-
      all$EM.output$normalized.centers[[1]][all$cluster]}**2+
      {all$filtered.data[[1]]$Cellularit/100-
          all$EM.output$normalized.centers[[2]][all$cluster]}**2
  )
  
  mean.error<-c(mean(pap.mut.err),
                    mean(ext.mut.err),
                    mean(all.mut.err))
  
  mean.driv.error<-c(mean(pap.err),
                     mean(ext.err),
                     mean(all.err))
  
  result<-data.frame(Pipeline = c("paper","extended","all"),
                     NMI = NMI,
                     Max.Distance.to.clone = Max.Distance.to.clone,
                     nclusters = nclusters,
                     mean.mut.error=mean.error,
                     mean.driv.error = mean.driv.error
  )
  return(result)
}


# Convert function
cnum<-function(x) as.numeric(as.character(x))
# MaxDistance
MaxDistance<-function(cellularit, cluster_cells){
  nclones<-length(cellularit[[1]])
  nclus<-length(cluster_cells[[1]])
  xclon<-cellularit[[1]]
  yclon<-cellularit[[2]]

  result<-matrix(nrow = nclus,ncol = nclones)
  
  for(i in 1:nclus){
    result[i,]<-sqrt((cnum(cluster_cells[[1]][i])-xclon)**2+
                       (cnum(cluster_cells[[2]][i])-yclon)**2
    )
  }
  minClustClon<-apply(X = result,MARGIN = 1,min) ### Find the clone that is closest to cluster
  return(max(minClustClon))
  
}

reproduce<-function(iterations,number_mutations,ndrivers){
  set.seed(234)
  
  for(iter in 1:iterations){
    toy.data<-QuantumCat_stringent(number_of_clones = 6,number_of_mutations = number_mutations,
                                   ploidy = "AB",depth = 100,
                                   contamination = c(0.3,0.4),min_depth = 50)
    permissive<-QuantumCat_permissive(fromQuantumCat = toy.data ,number_of_mutations = number_mutations,
                                      ploidy = "AB",depth = 100,
                                      contamination = c(0.3,0.4),max_depth = 50, min_depth = 30)
    drivers_id<-sample(1:(2*number_mutations),size = ndrivers,prob = rep(c(1/{4*number_mutations},
                                                                           3/{4*number_mutations}),
                                                                         each = number_mutations)
    )
    drivers_id<-drivers_id[order(drivers_id)]
    
    
    ext<-extended(filtered = toy.data,
                  permissive = permissive,
                  drivers_id = drivers_id)
    pap<-paper_pipeline(filtered = toy.data,
                        permissive = permissive,
                        drivers_id = drivers_id)
    
    all<-All(filtered = toy.data,
             permissive = permissive,
             drivers_id = drivers_id)
    
    Quality<-compare_qual(paper = pap,
                          extended = ext,
                          all = all,
                          drivers_id = drivers_id)
    
    if(iter == 1){
      result<-Quality
    }
    else{
      result<-rbind(result,Quality)
    }
  }
  
  return(result)
}