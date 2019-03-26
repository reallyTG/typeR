library(OpenImageR)


### Name: GaborFeatureExtract
### Title: Gabor Feature Extraction
### Aliases: GaborFeatureExtract
### Keywords: datasets

### ** Examples


library(OpenImageR)

init_gb = GaborFeatureExtract$new()

# gabor-filter-bank
#------------------

gb_f = init_gb$gabor_filter_bank(scales = 5, orientations = 8, gabor_rows = 39,

                                 gabor_columns = 39, plot_data = TRUE)


# plot gabor-filter-bank
#-----------------------

plt_f = init_gb$plot_gabor(real_matrices = gb_f$gabor_real, margin_btw_plots = 0.65,

                           thresholding = FALSE)


# read image
#-----------

pth_im = system.file("tmp_images", "car.png", package = "OpenImageR")

im = readImage(pth_im) * 255


# gabor-feature-extract
#----------------------

# gb_im = init_gb$gabor_feature_extraction(image = im, scales = 5, orientations = 8,

#                                          downsample_gabor = TRUE, downsample_rows = 3,

#                                          downsample_cols = 3, gabor_rows = 39, gabor_columns = 39,

#                                          plot_data = TRUE, normalize_features = FALSE,

#                                          threads = 6)


# plot real data of gabor-feature-extract
#----------------------------------------

# plt_im = init_gb$plot_gabor(real_matrices = gb_im$gabor_features_real, margin_btw_plots = 0.65,

#                             thresholding = FALSE)


# feature generation for a matrix of images (such as the mnist data set)
#-----------------------------------------------------------------------

ROWS = 13; COLS = 13; SCAL = 3; ORIEN = 5; nrow_mt = 500; im_width = 12; im_height = 15

set.seed(1)
im_mt = matrix(sample(1:255, nrow_mt * im_width * im_height, replace = TRUE), nrow = nrow_mt,

                      ncol = im_width * im_height)

# gb_ex = init_gb$gabor_feature_engine(img_data = im_mt, img_nrow = im_width, img_ncol = im_height,

#                                      scales = SCAL, orientations = ORIEN, gabor_rows = ROWS,

#                                      gabor_columns = COLS, downsample_gabor = FALSE,

#                                      downsample_rows = NULL, downsample_cols = NULL,

#                                      normalize_features = TRUE, threads = 1, verbose = FALSE)


# plot of multiple image in same figure
#---------------------------------------

list_images = list(im, im, im)

plt_multi = init_gb$plot_multi_images(list_images, par_ROWS = 2, par_COLS = 2)




