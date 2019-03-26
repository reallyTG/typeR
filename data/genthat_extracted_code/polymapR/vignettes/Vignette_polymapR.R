## ---- eval = FALSE-------------------------------------------------------
#  ?seq
#  

## ------------------------------------------------------------------------
seq(from = 2,
    to = 14,
    by = 3)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("polymapR")

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(
  data.frame(Marker=paste0("mymarker", c(1:3)),
             P1=c(1,2,0),
             P2=c(0,4,3),
             F1.001=c(1,3,2),
             F1.002..=c(1,2,2)
             )
  )


## ---- eval = FALSE-------------------------------------------------------
#  ALL_dosages <- read.csv("tetraploid_dosages.csv",
#                          stringsAsFactors = FALSE,
#                          row.names = 1) #first column contains rownames

## ---- echo = FALSE, message = FALSE, error = FALSE-----------------------
library(polymapR)
data(ALL_dosages)
ALL_dosages <- as.data.frame(ALL_dosages)

## ------------------------------------------------------------------------
class(ALL_dosages)

## ------------------------------------------------------------------------
ALL_dosages <- as.matrix(ALL_dosages)

class(ALL_dosages)
head(ALL_dosages[,1:5])
dim(ALL_dosages)


## ---- message = FALSE, error = FALSE-------------------------------------
library(polymapR)
data(ALL_dosages)

## ---- message = FALSE, error = FALSE-------------------------------------
library(polymapR)


## ---- eval = FALSE-------------------------------------------------------
#  F1checked <- checkF1(dosage_matrix = ALL_dosages,parent1 = "P1",parent2 = "P2",
#                       F1 = colnames(ALL_dosages)[3:ncol(ALL_dosages)],
#                       polysomic = TRUE, disomic = FALSE, mixed = FALSE, ploidy = 4)
#  
#  head(F1checked)

## ---- echo = FALSE-------------------------------------------------------
load("polymapR_vignette.RData")
head(F1checked)

## ---- fig.width = 7, fig.height = 5--------------------------------------
mds <- marker_data_summary(dosage_matrix = ALL_dosages,
                           ploidy = 4,
                           pairing = "random",
                           parent1 = "P1",
                           parent2 = "P2",
                           progeny_incompat_cutoff = 0.05)

pq_before_convert <- parental_quantities(dosage_matrix = ALL_dosages, 
                                         las = 2)

## ---- fig.width = 7, fig.height = 5--------------------------------------
segregating_data <- convert_marker_dosages(dosage_matrix = ALL_dosages)
pq_after_convert <- parental_quantities(dosage_matrix = segregating_data)


## ---- fig.width = 6, fig.height = 6--------------------------------------
screened_data <- screen_for_NA_values(dosage_matrix = segregating_data, 
                                      margin = 1, # margin 1 means markers
                                      cutoff =  0.10,
                                      print.removed = FALSE) 


## ---- fig.width = 6, fig.height = 6--------------------------------------
screened_data2 <- screen_for_NA_values(dosage_matrix = screened_data, 
                                       cutoff = 0.1, 
                                       margin = 2, #margin = 2 means columns
                                       print.removed = FALSE)

## ---- fig.width = 6, fig.height = 6--------------------------------------
screened_data3 <- screen_for_duplicate_individuals(dosage_matrix = screened_data2, 
                                                   cutoff = 0.95, 
                                                   plot_cor = T)


## ------------------------------------------------------------------------
screened_data4 <- screen_for_duplicate_markers(dosage_matrix = screened_data3)

dim(screened_data4$filtered_dosage_matrix) 

filtered_data <- screened_data4$filtered_dosage_matrix 


## ---- fig.width = 6, fig.height = 6--------------------------------------
pq_screened_data <- parental_quantities(dosage_matrix = filtered_data)


## ---- eval = FALSE-------------------------------------------------------
#  SN_SN_P1 <- linkage(dosage_matrix = filtered_data,
#                      markertype1 = c(1,0),
#                      target_parent = "P1",
#                      other_parent = "P2",
#                      ploidy = 4,
#                      pairing = "random"
#  )

## ---- fig.width = 6, fig.height = 6--------------------------------------
plot_linkage_df(SN_SN_P1, r_max = 0.5)

## ---- fig.width = 6, fig.height = 6--------------------------------------
P1deviations <- SNSN_LOD_deviations(linkage_df = SN_SN_P1,
                                    ploidy = 4,
                                    N = ncol(filtered_data) - 2, #The F1 population size
                                    alpha = c(0.05,0.2),
                                    plot_expected = TRUE,
                                    phase="coupling")

## ------------------------------------------------------------------------
SN_SN_P1.1 <- SN_SN_P1[SN_SN_P1$phase == "coupling",][-which(P1deviations > 0.2),]

## ---- fig.width = 6, fig.height = 6--------------------------------------
P1_homologues <- cluster_SN_markers(linkage_df = SN_SN_P1, 
                                    LOD_sequence = seq(3, 10, 0.5), 
                                    LG_number = 5,
                                    ploidy = 4,
                                    parentname = "P1",
                                    plot_network = FALSE,
                                    plot_clust_size = FALSE)


## ------------------------------------------------------------------------
P1_hom_LOD3.5 <- P1_homologues[["3.5"]]
t <- table(P1_hom_LOD3.5$cluster)
print(paste("Number of clusters:",length(t)))
t[order(as.numeric(names(t)))]

P1_hom_LOD5 <- P1_homologues[["5"]]
t <- table(P1_hom_LOD5$cluster)
print(paste("Number of clusters:",length(t)))
t[order(as.numeric(names(t)))]

## ------------------------------------------------------------------------
LGHomDf_P1 <- define_LG_structure(cluster_list = P1_homologues, 
                                  LOD_chm = 3.5, 
                                  LOD_hom = 5, 
                                  LG_number = 5)

head(LGHomDf_P1)

## ---- fig.width = 6, fig.height = 6--------------------------------------

SN_SN_P1_coupl <- SN_SN_P1[SN_SN_P1$phase == "coupling",] # select only markerpairs in coupling

P1_homologues_1 <- cluster_SN_markers(linkage_df = SN_SN_P1_coupl, 
                                    LOD_sequence = c(3:12), 
                                    LG_number = 5,
                                    ploidy = 4,
                                    parentname = "P1",
                                    plot_network = FALSE,
                                    plot_clust_size = FALSE)


## ---- eval = FALSE-------------------------------------------------------
#  SN_DN_P1 <- linkage(dosage_matrix = filtered_data,
#                      markertype1 = c(1,0),
#                      markertype2 = c(2,0),
#                      target_parent = "P1",
#                      other_parent = "P2",
#                      ploidy = 4,
#                      pairing = "random")

## ---- fig.width = 6, fig.height = 6--------------------------------------
LGHomDf_P1_1 <- bridgeHomologues(cluster_stack = P1_homologues_1[["6"]], 
                               linkage_df = SN_DN_P1, 
                               LOD_threshold = 4, 
                               automatic_clustering = TRUE, 
                               LG_number = 5,
                               parentname = "P1")

## ------------------------------------------------------------------------
table(LGHomDf_P1_1$LG, LGHomDf_P1_1$homologue)

## ---- eval=FALSE---------------------------------------------------------
#  SN_SN_P2 <- linkage(dosage_matrix = filtered_data,
#                      markertype1 = c(1,0),
#                      target_parent = "P2",
#                      other_parent = "P1",
#                      ploidy = 4,
#                      pairing = "random"
#  )

## ---- fig.width = 6, fig.height = 6--------------------------------------
SN_SN_P2_coupl <- SN_SN_P2[SN_SN_P2$phase == "coupling",] # get only markerpairs in coupling

P2_homologues <- cluster_SN_markers(linkage_df = SN_SN_P2_coupl, 
                                    LOD_sequence = c(3:12), 
                                    LG_number = 5,
                                    ploidy = 4,
                                    parentname = "P2",
                                    plot_network = FALSE,
                                    plot_clust_size = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  SN_DN_P2 <- linkage(dosage_matrix = filtered_data,
#                      markertype1 = c(1,0),
#                      markertype2 = c(2,0),
#                      target_parent = "P2",
#                      other_parent = "P1",
#                      ploidy = 4,
#                      pairing = "random")

## ---- fig.width = 6, fig.height = 6--------------------------------------
LGHomDf_P2 <- bridgeHomologues(cluster_stack = P2_homologues[["6"]], 
                               linkage_df = SN_DN_P2, 
                               LOD_threshold = 4, 
                               automatic_clustering = TRUE, 
                               LG_number = 5,
                               parentname = "P2")

table(LGHomDf_P2$LG,LGHomDf_P2$homologue)

## ---- fig.width = 7, fig.height = 6--------------------------------------
overviewSNlinks(linkage_df = SN_SN_P2,
                LG_hom_stack = LGHomDf_P2,
                LG_number = 2,
                LOD_threshold = 2)


## ------------------------------------------------------------------------
LGHomDf_P2_1 <- merge_homologues(LG_hom_stack = LGHomDf_P2,
                                 ploidy = 4,
                                 linkage_group = 2,
                                 mergeList = list(c(4,5)))


## ---- fig.width = 7.5, fig.height = 6------------------------------------
cluster_per_LG(LG = 2,
               linkage_df = SN_SN_P2[SN_SN_P2$phase == "coupling",], 
               LG_hom_stack = LGHomDf_P2, 
               LOD_sequence = c(3:10), # The first element is used for network layout
               modify_LG_hom_stack = FALSE, 
               network.layout = "stacked",
               nclust_out = 4,
               label.offset=1.2)


## ------------------------------------------------------------------------
LGHomDf_P2_1 <- cluster_per_LG(LG = 2, 
                               linkage_df = SN_SN_P2[SN_SN_P2$phase == "coupling",], 
                               LG_hom_stack = LGHomDf_P2, 
                               LOD_sequence = 3, 
                               modify_LG_hom_stack = TRUE, 
                               network.layout = "n",
                               nclust_out = 4)

table(LGHomDf_P2_1$homologue, LGHomDf_P2_1$LG)

## ------------------------------------------------------------------------
get("seg_p3_random",envir=getNamespace("polymapR"))

## ---- eval=FALSE---------------------------------------------------------
#  data("TRI_dosages")
#  
#  SN_SN_P2.tri <- linkage(dosage_matrix = TRI_dosages,
#                      markertype1 = c(0,1),
#                      target_parent = "P2", #Note the target parent is P2
#                      other_parent = "P1",
#                      ploidy = 4,
#                      ploidy2 = 2,
#                      pairing = "random"
#  )

## ---- fig.width = 6, fig.height = 6--------------------------------------
plot_linkage_df(SN_SN_P2.tri)

## ---- fig.width = 6, fig.height = 6--------------------------------------
P2_homologues.tri <- cluster_SN_markers(linkage_df = SN_SN_P2.tri, 
                                    LOD_sequence = seq(3, 10, 1), 
                                    LG_number = 3,
                                    ploidy = 2, #because P2 is diploid..
                                    parentname = "P2",
                                    plot_network = FALSE,
                                    plot_clust_size = FALSE) 


## ------------------------------------------------------------------------
LGHomDf_P2.tri <- phase_SN_diploid(linkage_df = SN_SN_P2.tri,
                                   cluster_list = P2_homologues.tri,
                                   LOD_chm = 4, #LOD at which chromosomes are identified
                                   LG_number = 3) #number of linkage groups

## ---- eval = FALSE-------------------------------------------------------
#  SN_SS_P1 <- linkage(dosage_matrix = filtered_data,
#                      markertype1 = c(1,0),
#                      markertype2 = c(1,1),
#                      target_parent = "P1",
#                      other_parent = "P2",
#                      ploidy = 4,
#                      pairing = "random")

## ------------------------------------------------------------------------
P1_SxS_Assigned <- assign_linkage_group(linkage_df = SN_SS_P1,
                                        LG_hom_stack = LGHomDf_P1,
                                        SN_colname = "marker_a",
                                        unassigned_marker_name = "marker_b",
                                        phase_considered = "coupling",
                                        LG_number = 5,
                                        LOD_threshold = 3,
                                        ploidy = 4)

head(P1_SxS_Assigned)

## ---- eval = FALSE-------------------------------------------------------
#  SN_SS_P2 <- linkage(dosage_matrix = filtered_data,
#                      markertype1 = c(1,0),
#                      markertype2 = c(1,1),
#                      target_parent = "P2",
#                      other_parent = "P1",
#                      ploidy = 4,
#                      pairing = "random")

## ------------------------------------------------------------------------
P2_SxS_Assigned <- assign_linkage_group(linkage_df = SN_SS_P2,
                                        LG_hom_stack = LGHomDf_P2_1,
                                        SN_colname = "marker_a",
                                        unassigned_marker_name = "marker_b",
                                        phase_considered = "coupling",
                                        LG_number = 5,
                                        LOD_threshold = 3,
                                        ploidy = 4)



## ------------------------------------------------------------------------
LGHomDf_P2_2 <- consensus_LG_names(modify_LG = LGHomDf_P2_1, 
                                   template_SxS = P1_SxS_Assigned, 
                                   modify_SxS = P2_SxS_Assigned)

P2_SxS_Assigned <- assign_linkage_group(linkage_df = SN_SS_P2,
                                        LG_hom_stack = LGHomDf_P2_2,
                                        SN_colname = "marker_a",
                                        unassigned_marker_name = "marker_b",
                                        phase_considered = "coupling",
                                        LG_number = 5,
                                        LOD_threshold = 3,
                                        ploidy = 4)


## ------------------------------------------------------------------------
P1_DxN_Assigned <- assign_linkage_group(linkage_df = SN_DN_P1,
                                        LG_hom_stack = LGHomDf_P1,
                                        SN_colname = "marker_a",
                                        unassigned_marker_name = "marker_b",
                                        phase_considered = "coupling",
                                        LG_number = 5,
                                        LOD_threshold = 3,
                                        ploidy = 4)

P2_DxN_Assigned <- assign_linkage_group(linkage_df = SN_DN_P2,
                                        LG_hom_stack = LGHomDf_P2_2,
                                        SN_colname = "marker_a",
                                        unassigned_marker_name = "marker_b",
                                        phase_considered = "coupling",
                                        LG_number = 5,
                                        LOD_threshold = 3,
                                        ploidy = 4)

## ---- eval = FALSE-------------------------------------------------------
#  marker_assignments_P1 <- homologue_lg_assignment(dosage_matrix = filtered_data,
#                                                   assigned_list = list(P1_SxS_Assigned,
#                                                                        P1_DxN_Assigned),
#                                                   assigned_markertypes = list(c(1,1), c(2,0)),
#                                                   LG_hom_stack = LGHomDf_P1,
#                                                   target_parent = "P1",
#                                                   other_parent = "P2",
#                                                   ploidy = 4,
#                                                   pairing = "random",
#                                                   convert_palindrome_markers = FALSE,
#                                                   LG_number = 5,
#                                                   LOD_threshold = 3,
#                                                   write_intermediate_files = FALSE
#  )

## ---- eval = FALSE-------------------------------------------------------
#  marker_assignments_P2 <- homologue_lg_assignment(dosage_matrix = filtered_data,
#                                                   assigned_list = list(P2_SxS_Assigned,
#                                                                        P2_DxN_Assigned),
#                                                   assigned_markertypes = list(c(1,1), c(2,0)),
#                                                   LG_hom_stack = LGHomDf_P2_2,
#                                                   target_parent = "P2",
#                                                   other_parent = "P1",
#                                                   ploidy = 4,
#                                                   pairing = "random",
#                                                   convert_palindrome_markers = TRUE,
#                                                   LG_number = 5,
#                                                   LOD_threshold = 3,
#                                                   write_intermediate_files = FALSE
#  )
#  

## ---- eval = FALSE-------------------------------------------------------
#  marker_assignments <- check_marker_assignment(marker_assignments_P1,marker_assignments_P2)

## ---- eval = FALSE-------------------------------------------------------
#  all_linkages_list_P1 <- finish_linkage_analysis(marker_assignment = marker_assignments$P1,
#                                                  dosage_matrix = filtered_data,
#                                                  target_parent = "P1",
#                                                  other_parent = "P2",
#                                                  convert_palindrome_markers = FALSE,
#                                                  ploidy = 4,
#                                                  pairing = "random",
#                                                  LG_number = 5)
#  
#  all_linkages_list_P2 <- finish_linkage_analysis(marker_assignment = marker_assignments$P2,
#                                                  dosage_matrix = filtered_data,
#                                                  target_parent = "P2",
#                                                  other_parent = "P1",
#                                                  convert_palindrome_markers = TRUE, # convert 3.1 markers
#                                                  ploidy = 4,
#                                                  pairing = "random",
#                                                  LG_number = 5)

## ---- eval = FALSE-------------------------------------------------------
#  str(all_linkages_list_P1)
#  

## ---- eval = FALSE-------------------------------------------------------
#  all_linkages_list_P1_split <- split_linkage_info(all_linkages = all_linkages_list_P1,
#                                                   marker_assignment = marker_assignments_P1,
#                                                   ploidy = 4)
#  
#  all_linkages_list_P2_split <- split_linkage_info(all_linkages = all_linkages_list_P2,
#                                                   marker_assignment = marker_assignments_P2,
#                                                   ploidy = 4)

## ---- eval = FALSE-------------------------------------------------------
#  str(all_linkages_list_P1_split)
#  write_nested_list(nested_list = all_linkages_list_P1, directory = "linkages_P1")

## ---- results = 'hide', eval = FALSE-------------------------------------
#  all_linkages_list_P1.binned <- marker_binning_list(dosage_matrix = filtered_data,
#                                              linkage_list = all_linkages_list_P1_split,
#                                              target_parent = "P1",
#                                              other_parent = "P2",
#                                              return_removed_marker_info = TRUE)
#  
#  all_linkages_list_P2.binned <- marker_binning_list(dosage_matrix = filtered_data,
#                                              linkage_list = all_linkages_list_P2_split,
#                                              target_parent = "P2",
#                                              other_parent = "P1",
#                                              return_removed_marker_info = TRUE)
#  

## ---- eval = FALSE-------------------------------------------------------
#  write_pwd_list(linkages_list = all_linkages_list_P1$linkage_list,
#                 target_parent = "P1",
#                 binned = T)
#  
#  write_pwd_list(linkages_list = all_linkages_list_P2$linkage_list,
#                 target_parent = "P2",
#                 binned = T)
#  

## ---- eval=FALSE---------------------------------------------------------
#  maplist_P1_LG1 <- MDSMap_from_list(all_linkages_list_P1_split$LG1,
#                                 write_to_file = FALSE
#                                 )
#  maplist_P2_LG1 <- MDSMap_from_list(all_linkages_list_P2_split$LG1,
#                                 write_to_file = FALSE)
#  
#  

## ---- eval = FALSE-------------------------------------------------------
#  linkages <- list()
#  for(lg in names(all_linkages_list_P1)){
#    linkages[[lg]] <- rbind(all_linkages_list_P1[[lg]], all_linkages_list_P2[[lg]])
#  }
#  
#  integrated.maplist <- MDSMap_from_list(linkages)
#  

## ---- eval = FALSE-------------------------------------------------------
#  complete_mapdata <- add_dup_markers(maplist = integrated.maplist,
#                                      bin_list = screened_data4$bin_list,
#                                      marker_assignments = marker_assignments)

## ---- eval = FALSE-------------------------------------------------------
#  integrated.maplist_complete <- complete_mapdata$maplist
#  marker_assignments_complete <- complete_mapdata$marker_assignments

## ---- eval=FALSE---------------------------------------------------------
#  phased.maplist <- create_phased_maplist(maplist = integrated.maplist,
#                                          dosage_matrix.conv = filtered_data,
#                                          N_linkages = 5,
#                                          ploidy = 4,
#                                          marker_assignment.1 = marker_assignments$P1,
#                                          marker_assignment.2 = marker_assignments$P2)

## ---- echo = FALSE-------------------------------------------------------
data("phased.maplist")

## ---- eval=FALSE---------------------------------------------------------
#  integrated_map_LG2 <- orient_and_merge_maps(maplist_P1[["LG2"]],
#                                             maplist_P2[["LG2"]],
#                                             connection_threshold = 3,
#                                             plot_graph=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  
#  integrated_maps <- list()
#  for(i in 1:5){
#    integrated_maps[[paste0("LG", i)]] <- orient_and_merge_maps(maplist_P1[[paste0("LG", i)]],
#                                                               maplist_P2[[paste0("LG", i)]],
#                                                               LPmerge_interval = 2,
#                                                               connection_threshold = 3,
#                                                               plot_graph=TRUE)
#  }
#  

## ---- echo = FALSE-------------------------------------------------------
data("maplist_P1_subset","integrated.maplist")
maplist_P1_LG1 <- maplist_P1_subset$LG1


## ---- fig.width = 7, fig.height = 7--------------------------------------
plot_map(maplist = integrated.maplist)


## ---- fig.width = 6, fig.height = 6--------------------------------------
plot_phased_maplist(phased.maplist = phased.maplist[1], #Can plot full list also, remove "[1]"
                    ploidy = 4,
                    cols = c("black","grey50","grey50"))

## ---- eval = FALSE-------------------------------------------------------
#  check_map(linkage_list = list(linkages$LG1), maplist = list(integrated.maplist$LG1))

## ---- out.width = "600px", echo = FALSE----------------------------------
knitr::include_graphics("figures/map_diagnostics.png")

## ----eval = FALSE--------------------------------------------------------
#  P1.prefPairing <- test_prefpairing(dosage_matrix = ALL_dosages,
#                                     maplist = integrated.maplist,
#                                     LG_hom_stack = LGHomDf_P1_1,
#                                     min_cM = 1, #changed from default of 0.5 cM
#                                     ploidy = 4)
#  
#  head(P1.prefPairing)
#  

## ----eval = FALSE--------------------------------------------------------
#  mean(P1.prefPairing[P1.prefPairing$P_value.adj < 0.01 & P1.prefPairing$LG_a == 1,]$pref.p)

## ----eval = FALSE--------------------------------------------------------
#  lg1_markers <- unique(c(rownames(marker_assignments_P1[marker_assignments_P1[,"Assigned_LG"] == 1,]),
#                          rownames(marker_assignments_P2[marker_assignments_P2[,"Assigned_LG"] == 1,])))
#  
#  filtered_data_lg1 <- filtered_data[rownames(filtered_data) %in% lg1_markers,]
#  
#  all_linkages_list_P1_lg1 <- finish_linkage_analysis(marker_assignment = marker_assignments$P1[rownames(marker_assignments$P1) %in% lg1_markers,],
#                                                      dosage_matrix = filtered_data_lg1,
#                                                      target_parent = "P1",
#                                                      other_parent = "P2",
#                                                      convert_palindrome_markers = FALSE,
#                                                      ploidy = 4,
#                                                      pairing = "preferential",
#                                                      prefPars = c(0.25,0), #just for example!
#                                                      LG_number = 1 #interested in just 1 chm.
#  )
#  

## ----eval = FALSE--------------------------------------------------------
#  write.TSNPM(phased.maplist = phased.maplist,ploidy=4)

