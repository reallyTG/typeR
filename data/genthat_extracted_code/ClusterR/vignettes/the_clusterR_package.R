## ---- eval = T-----------------------------------------------------------

library(ClusterR)

data(dietary_survey_IBS)

dim(dietary_survey_IBS)

X = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]   # data (excluding the response variable)

y = dietary_survey_IBS[, ncol(dietary_survey_IBS)]    # the response variable

dat = center_scale(X, mean_center = T, sd_scale = T)  # centering and scaling the data

## ---- eval = F-----------------------------------------------------------
#  gmm = GMM(dat, 2, dist_mode = "maha_dist", seed_mode = "random_subset", km_iter = 10,
#  
#            em_iter = 10, verbose = F)
#  
#  # predict centroids, covariance matrix and weights
#  
#  pr = predict_GMM(dat, gmm$centroids, gmm$covariance_matrices, gmm$weights)
#  

## ---- eval = F-----------------------------------------------------------
#  
#  opt_gmm = Optimal_Clusters_GMM(dat, max_clusters = 10, criterion = "BIC",
#  
#                                 dist_mode = "maha_dist", seed_mode = "random_subset",
#  
#                                 km_iter = 10, em_iter = 10, var_floor = 1e-10,
#  
#                                 plot_data = T)
#  

## ---- eval = F-----------------------------------------------------------
#  
#  res = external_validation(dietary_survey_IBS$class, pr$cluster_labels,
#  
#                            method = "adjusted_rand_index", summary_stats = T)
#  
#  res
#  
#  ##
#  ## ----------------------------------------
#  ## purity                         : 1
#  ## entropy                        : 0
#  ## normalized mutual information  : 1
#  ## variation of information       : 0
#  ## ----------------------------------------
#  ## specificity                    : 1
#  ## sensitivity                    : 1
#  ## precision                      : 1
#  ## recall                         : 1
#  ## F-measure                      : 1
#  ## ----------------------------------------
#  ## accuracy OR rand-index         : 1
#  ## adjusted-rand-index            : 1
#  ## jaccard-index                  : 1
#  ## fowlkes-mallows-index          : 1
#  ## mirkin-metric                  : 0
#  ## ----------------------------------------
#  

## ---- eval = F-----------------------------------------------------------
#  
#  pca_dat = stats::princomp(dat)$scores[, 1:2]
#  
#  km = KMeans_arma(pca_dat, clusters = 2, n_iter = 10, seed_mode = "random_subset",
#  
#                   verbose = T, CENTROIDS = NULL)
#  
#  pr = predict_KMeans(pca_dat, km)
#  
#  table(dietary_survey_IBS$class, pr)
#  
#  class(km) = 'matrix'
#  
#  plot_2d(data = pca_dat, clusters = as.vector(pr), centroids_medoids = as.matrix(km))

## ----fig.width = 3.0, fig.height = 3.0, echo = T, eval = T---------------

library(OpenImageR)

path = 'elephant.jpg'

im = readImage(path)

# first resize the image to reduce the dimensions
im = resizeImage(im, 75, 75, method = 'bilinear')            

imageShow(im)                                                # plot the original image

im2 = apply(im, 3, as.vector)                                # vectorize RGB

## ----eval = T------------------------------------------------------------

# perform KMeans_rcpp clustering

km_rc = KMeans_rcpp(im2, clusters = 5, num_init = 5, max_iters = 100, 
                    
                    initializer = 'optimal_init', verbose = F)

km_rc$between.SS_DIV_total.SS

## ----fig.width = 3.0, fig.height = 3.0, echo = T, eval = T---------------
getcent = km_rc$centroids

getclust = km_rc$clusters

new_im = getcent[getclust, ]     # each observation is associated with the nearby centroid

dim(new_im) = c(nrow(im), ncol(im), 3)        # back-convertion to a 3-dimensional image

imageShow(new_im)

## ----fig.width = 5.0, fig.height = 5.0, echo = T, eval = T---------------

opt = Optimal_Clusters_KMeans(im2, max_clusters = 10, plot_clusters = T,
                              
                              criterion = 'distortion_fK', fK_threshold = 0.85,
                              
                              initializer = 'optimal_init', tol_optimal_init = 0.2)


## ----fig.width = 3.0, fig.height = 3.0, echo = T, eval = T---------------

path_d = 'dog.jpg'

im_d = readImage(path_d)

# first resize the image to reduce the dimensions
im_d = resizeImage(im_d, 350, 350, method = 'bilinear')            

imageShow(im_d)                                                # plot the original image

im3 = apply(im_d, 3, as.vector)                                # vectorize RGB

dim(im3)                                              # initial dimensions of the data

## ----fig.width = 3.0, fig.height = 3.0, echo = T, eval = T---------------

start = Sys.time()

km_init = KMeans_rcpp(im3, clusters = 5, num_init = 5, max_iters = 100, 
                    
                    initializer = 'kmeans++', verbose = F)

end = Sys.time()

t = end - start
  
cat('time to complete :', t, attributes(t)$units, '\n')

getcent_init = km_init$centroids

getclust_init = km_init$clusters

new_im_init = getcent_init[getclust_init, ]  # each observation is associated with the nearby centroid

dim(new_im_init) = c(nrow(im_d), ncol(im_d), 3)     # back-convertion to a 3-dimensional image

imageShow(new_im_init)

## ----fig.width = 3.0, fig.height = 3.0, echo = T, eval = T---------------

start = Sys.time()

km_mb = MiniBatchKmeans(im3, clusters = 5, batch_size = 20, num_init = 5, max_iters = 100, 
                        
                        init_fraction = 0.2, initializer = 'kmeans++', early_stop_iter = 10,
                        
                        verbose = F)

pr_mb = predict_MBatchKMeans(im3, km_mb$centroids)

end = Sys.time()

t = end - start
  
cat('time to complete :', t, attributes(t)$units, '\n')

getcent_mb = km_mb$centroids

new_im_mb = getcent_mb[pr_mb, ]   # each observation is associated with the nearby centroid

dim(new_im_mb) = c(nrow(im_d), ncol(im_d), 3)     # back-convertion to a 3-dimensional image

imageShow(new_im_mb)

## ---- eval = T-----------------------------------------------------------

data(mushroom)

X = mushroom[, -1]

y = as.numeric(mushroom[, 1])            # convert the labels to numeric

gwd = FD::gowdis(X)           # calculate the 'gower' distance for the factor variables

gwd_mat = as.matrix(gwd)                 # convert the distances to a matrix

cm = Cluster_Medoids(gwd_mat, clusters = 2, swap_phase = TRUE, verbose = F)


## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(adusted_rand_index = external_validation(y, cm$clusters, method = "adjusted_rand_index", summary_stats = F), avg_silhouette_width = mean(cm$silhouette_matrix[, 'silhouette_widths'])), caption = "Non-Weigthed-K-medoids", align = 'l')

## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(predictors = c("cap_shape", "cap_surface", "cap_color", "bruises", "odor", 
"gill_attachment", "gill_spacing", "gill_size", "gill_color", 
"stalk_shape", "stalk_root", "stalk_surface_above_ring", "stalk_surface_below_ring", 
"stalk_color_above_ring", "stalk_color_below_ring", "veil_type", 
"veil_color", "ring_number", "ring_type", "spore_print_color", 
"population", "habitat"), weights = c(4.626, 38.323, 55.899, 34.028, 169.608, 6.643, 42.08, 57.366, 
37.938, 33.081, 65.105, 18.718, 76.165, 27.596, 26.238, 0.0, 1.507, 
37.314, 32.685, 127.87, 64.019, 44.519)), align = 'l')

## ---- eval = T-----------------------------------------------------------

weights = c(4.626, 38.323, 55.899, 34.028, 169.608, 6.643, 42.08, 57.366, 37.938, 
            
            33.081, 65.105, 18.718, 76.165, 27.596, 26.238, 0.0, 1.507, 37.314, 
            
            32.685, 127.87, 64.019, 44.519)

gwd_w = FD::gowdis(X, w = weights)       # 'gower' distance using weights

gwd_mat_w = as.matrix(gwd_w)                 # convert the distances to a matrix

cm_w = Cluster_Medoids(gwd_mat_w, clusters = 2, swap_phase = TRUE, verbose = F)


## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(adusted_rand_index = external_validation(y, cm_w$clusters, method = "adjusted_rand_index", summary_stats = F), avg_silhouette_width = mean(cm_w$silhouette_matrix[, 'silhouette_widths'])), caption = "Weigthed-K-medoids", align = 'l')

## ---- eval = T-----------------------------------------------------------

cl_X = X        # copy initial data 

# the Clara_Medoids function allows only numeric attributes
# so first convert to numeric

for (i in 1:ncol(cl_X)) { cl_X[, i] = as.numeric(cl_X[, i]) }

start = Sys.time()

cl_f = Clara_Medoids(cl_X, clusters = 2, distance_metric = 'hamming', samples = 5, 
                     
                     sample_size = 0.2, swap_phase = TRUE, verbose = F, threads = 1)

end = Sys.time()

t = end - start
  
cat('time to complete :', t, attributes(t)$units, '\n')

## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(adusted_rand_index = external_validation(y, cl_f$clusters, method = "adjusted_rand_index", summary_stats = F), avg_silhouette_width = mean(cl_f$silhouette_matrix[, 'silhouette_widths'])), caption = "hamming-Clara-Medoids", align = 'l')

## ---- eval = T-----------------------------------------------------------

start = Sys.time()

cl_e = Cluster_Medoids(cl_X, clusters = 2, distance_metric = 'hamming', swap_phase = TRUE, 
                       
                       verbose = F, threads = 1)

end = Sys.time()

t = end - start
  
cat('time to complete :', t, attributes(t)$units, '\n')

## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(adusted_rand_index = external_validation(y, cl_e$clusters, method = "adjusted_rand_index", summary_stats = F), avg_silhouette_width = mean(cl_e$silhouette_matrix[, 'silhouette_widths'])), caption = "hamming-Cluster-Medoids", align = 'l')

## ---- eval = T-----------------------------------------------------------

# Silhouette Plot for the "Clara_Medoids" object

Silhouette_Dissimilarity_Plot(cl_f, silhouette = TRUE)


## ---- eval = T-----------------------------------------------------------

# Silhouette Plot for the "Cluster_Medoids" object

Silhouette_Dissimilarity_Plot(cl_e, silhouette = TRUE)


