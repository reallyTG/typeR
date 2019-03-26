## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  #Install
#  install.packages('M2SMF')
#  #Load
#  library(M2SMF)

## ----eval=FALSE----------------------------------------------------------
#  install.packages('/path/to/file/M2SMF.tar.gz',repos=NULL,type="source")

## ----eval=FALSE----------------------------------------------------------
#  data_list = simu_data_gen()

## ----eval=FALSE----------------------------------------------------------
#  truelabel = rep(c(1:5),each=20)

## ----eval=FALSE----------------------------------------------------------
#  #Assign the number of samples to permute
#  pert_num = 10
#  #Radomly sample *pert_num* samples from all the samples
#  index1  =  sample(c(1:100),n=pert_num)
#  #Permute the samples by index
#  index2  =  gtools::permute(index1)
#  #Reassign them to the first modality data
#  temp_data = data_list[[1]]
#  sub_data  =  temp_data[index1,]
#  temp_data[index2,]  =  sub_data
#  data_list[[1]] = temp_data

## ----eval=FALSE----------------------------------------------------------
#  for (i in 1:length(data_list))
#  {
#      data_list[[i]] = Standard_Normalization(data_list[[i]])
#  }

## ----eval=FALSE----------------------------------------------------------
#  for (i in 1:length(data_list))
#  {
#      data_list[[i]] = dist2eu(data_list[[i]],data_list[[i]])
#  }

## ----eval=FALSE----------------------------------------------------------
#  for (i in 1:length(data_list))
#  {
#      data_list[[i]] = affinityMatrix(data_list[[i]])
#  }

## ----eval=FALSE----------------------------------------------------------
#  #Assign the parameters
#  lambda = 0.25
#  theta = 10^-4
#  k = 5
#  res = M2SMF(data_list,lambda,theta,k)

## ----eval=FALSE----------------------------------------------------------
#  #Assign the interval of k according to your data
#  k_min = 2
#  k_max = 30
#  #Initialize the varible
#  modularity_data = vector("numeric",(k_max-k_min+1))
#  #Test all the k
#  for (i in k_min:k_max)
#  {
#      res = M2SMF(data_list,lambda,theta,i)
#      modularity_data[i-k_min+1] = new_modularity(res,data_list)
#  }
#  #The most proper is the one with maximum modularity
#  best_k = which(modularity_data==max(modularity_data),T)+k_min-1

## ----eval=FALSE----------------------------------------------------------
#  #Calculate the NMI of our method *M2SMF*
#  M2SMF_res = M2SMF(data_list,lambda,theta,i)
#  M2SMF_cluster = M2SMF_res$clusters
#  M2SMF_NMI = cal_NMI(true_label,M2SMF_cluster)
#  #Calculate the NMI of *SNF*
#  SNF_res = SNF(data_list,20,10)
#  SNF_cluster = SNF_res$clusters
#  SNF_NMI = cal_NMI(true_label,SNF_cluster)

