## ---- eval = T-----------------------------------------------------------

library(OpenImageR)

path = file.path(getwd(), 'vignette_1', 'image1.jpeg')

im = readImage(path)
dim(im)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

imageShow(im)


## ---- eval = F-----------------------------------------------------------
#  
#  writeImage(im, file_name = 'my_image.jpeg')
#  

## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

path = file.path(getwd(), 'vignette_1', 'image2.jpg')

im = readImage(path)

imageShow(im)

## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------
r2g = rgb_2gray(im)

imageShow(r2g)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

eq_sp = cropImage(im, new_width = 200, new_height = 200, type = 'equal_spaced')

imageShow(eq_sp)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

us_def = cropImage(im, new_width = 20:225, new_height = 5:185, type = 'user_defined')

imageShow(us_def)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

path = file.path(getwd(), 'vignette_1', 'image1.jpeg')

im = readImage(path)

imageShow(im)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

flp_vert = flipImage(im, mode = 'horizontal')

imageShow(flp_vert)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

r270 = rotateFixed(im, 270)

imageShow(r270)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------


r45 = rotateImage(im, 45, threads = 1)

imageShow(r45)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

path = file.path(getwd(), 'vignette_1', 'image2.jpg')

im = readImage(path)

intBl = resizeImage(im, width = 100, height = 100, method = 'bilinear')

imageShow(intBl)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

intGbl = down_sample_image(im, factor = 2.5, gaussian_blur = T)

imageShow(intGbl)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------


tr = translation(im, shift_rows = 50, shift_cols = -50)

imageShow(tr)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

path = file.path(getwd(), 'vignette_1', 'image1.jpeg')

im = readImage(path)

edsc = edge_detection(im, method = 'Scharr', conv_mode = 'same')

imageShow(edsc)


## ----echo = T, eval = T--------------------------------------------------

kernel_size =  c(4,4)

unf = uniform_filter(im, size = kernel_size, conv_mode = 'same')

unif_filt = matrix(1, ncol = kernel_size[1], nrow = kernel_size[2])/(kernel_size[1] * kernel_size[2])
unif_filt


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

path = file.path(getwd(), 'vignette_1', 'image2.jpg')

im = readImage(path)

thr = image_thresholding(im, thresh = 0.5)

imageShow(thr)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

gcor = gamma_correction(im, gamma = 2)        # show image with gamma correction 

imageShow(gcor)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

res = ZCAwhiten(im, k = 20, epsilon = 0.1)

imageShow(res)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

res_delate = delationErosion(im, Filter = c(8,8), method = 'delation')

imageShow(res_delate)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

res_erosion = delationErosion(im, Filter = c(8,8), method = 'erosion')

imageShow(res_erosion)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

path = file.path(getwd(), 'vignette_1', 'image1.jpeg')

im = readImage(path)

dim(im)

augm = Augmentation(im, flip_mode = 'horizontal', crop_width = 20:460, crop_height = 30:450, 
                    
                    resiz_width = 180, resiz_height = 180, resiz_method = 'bilinear', 
                    
                    shift_rows = 0, shift_cols = 0, rotate_angle = 350, 
                    
                    rotate_method = 'bilinear', zca_comps = 100, 
                    
                    zca_epsilon = 0.1, image_thresh = 0.0, verbose = T)

imageShow(augm)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

# random rotations
samp_rot = sample(c(seq(5, 90, 30), seq(270, 350, 30)), 3, replace = F)

# random shift of rows
samp_shif_rows = sample(seq(-50, 50, 10), 3, replace = F)

# random shift of columns
samp_shif_cols = sample(seq(-50, 50, 10), 3, replace = F)



res = lapply(1:length(samp_rot), function(x) 
  
  Augmentation(im, flip_mode = 'horizontal', crop_width = 20:460, crop_height = 30:450, 
               
               resiz_width = 180, resiz_height = 180, resiz_method = 'bilinear', 
                    
               shift_rows = samp_shif_rows[x], shift_cols = samp_shif_cols[x], 
               
               rotate_angle = samp_rot[x], rotate_method = 'bilinear', zca_comps = 100, 
              
               zca_epsilon = 0.1, image_thresh = 0.0, verbose = F))


print(length(res))

imageShow(res[[1]])


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

imageShow(res[[2]])


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

imageShow(res[[3]])


## ---- eval = T-----------------------------------------------------------

path = file.path(getwd(), 'vignette_1', 'image2.jpg')

image = readImage(path)

image = image * 255

hog = HOG(image, cells = 3, orientations = 6)
hog


## ---- eval = T-----------------------------------------------------------

path_im1 = file.path(getwd(), 'vignette_1', 'image1.jpeg')
path_im2 = file.path(getwd(), 'vignette_1', 'image2.jpg')

tmp_im1 = readImage(path_im1)
tmp_im2 = readImage(path_im2)

tmp_im1 = resizeImage(tmp_im1, 200, 200)
tmp_im2 = resizeImage(tmp_im2, 200, 200)

tmp_gray1 = rgb_2gray(tmp_im1)
tmp_gray2 = rgb_2gray(tmp_im2)
dim(tmp_gray2)

tmp_arr = array(0, c(nrow(tmp_gray1), ncol(tmp_gray1), 2))
tmp_arr[,,1] = tmp_gray1
tmp_arr[,,2] = tmp_gray2

res = HOG_apply(tmp_arr, cells = 2, orientations = 3)
res


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

path = file.path(getwd(), 'vignette_1', 'view1.jpg')

image = readImage(path)

imageShow(image)

image = rgb_2gray(image)

aveg_hash = average_hash(image, hash_size = 8, MODE = 'hash', resize = "bilinear")
aveg_hash

aveg_bin = average_hash(image, hash_size = 8, MODE = 'binary', resize = "bilinear")
as.vector(aveg_bin)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

path = file.path(getwd(), 'vignette_1', 'view2.jpg')

image2 = readImage(path)

imageShow(image2)

image2 = rgb_2gray(image2)

ph_hash = phash(image2, hash_size = 8, highfreq_factor = 4, MODE = 'hash', resize = "bilinear")
ph_hash

ph_bin = phash(image2, hash_size = 8, highfreq_factor = 4, MODE = 'binary', resize = "bilinear")
as.vector(ph_bin)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

path = file.path(getwd(), 'vignette_1', 'view3.jpg')

image3 = readImage(path)

imageShow(image3)


image3a = rgb_2gray(image3)

dh_hash = dhash(image3a, hash_size = 8, MODE = 'hash', resize = "bilinear")
dh_hash

dh_bin = dhash(image3a, hash_size = 8, MODE = 'binary', resize = "bilinear")
as.vector(dh_bin)

## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

tmp_image3 = gamma_correction(image3, gamma = 0.5)

imageShow(tmp_image3)

tmp_image3 = rgb_2gray(tmp_image3)

dh_hash_a = dhash(tmp_image3, hash_size = 8, MODE = 'hash', resize = "bilinear")
dh_hash_a

dh_bin_a = dhash(tmp_image3, hash_size = 8, MODE = 'binary', resize = "bilinear")
as.vector(dh_bin_a)


## ----fig.width = 1.0, fig.height = 1.0, echo = T, eval = T---------------

image3b = flipImage(image3, mode = "horizontal")

imageShow(image3b)

image3b = rgb_2gray(image3b)

dh_hash_b = dhash(image3b, hash_size = 8, MODE = 'hash', resize = "bilinear")
dh_hash_b

dh_bin_b = dhash(image3b, hash_size = 8, MODE = 'binary', resize = "bilinear")
as.vector(dh_bin_b)


## ---- eval = T-----------------------------------------------------------


inv_hash = invariant_hash(image3a, image3b, mode = 'binary', flip = T, rotate = T, 
                          
                          angle_bidirectional = 10, crop = T)
inv_hash

inv_bin = invariant_hash(image3a, image3b, mode = 'hash', flip = T, rotate = T, 
                         
                         angle_bidirectional = 10, crop = T)
inv_bin


## ---- eval = T-----------------------------------------------------------

path = paste0(getwd(), '/TEST_hash/')


hapl_hash = hash_apply(path, hash_size = 6, method = "dhash", mode = "hash", threads = 1,  resize = "nearest")
hapl_hash                # returns both the names of the images and the hash values

hapl_bin = hash_apply(path, hash_size = 6, method = "dhash", mode = "binary", threads = 1,  resize = "nearest")
hapl_bin$files             # names of the images
dim(hapl_bin$hash)         # dimensions of the resulted matrix
head(hapl_bin$hash)        # binary features


## ---- eval = T, echo = F-------------------------------------------------

# remove cache once vignettes are built

# unlink("The_OpenImageR_package_files", recursive = TRUE)


