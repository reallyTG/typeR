## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  Sys.setenv(kairos_id = "Your Kairos API id")
#  Sys.setenv(kairos_key = "Your Kairos API key")

## ---- eval = FALSE-------------------------------------------------------
#  library(facerec)
#  facerec_init()

## ---- eval = FALSE-------------------------------------------------------
#  finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
#  finn_face <- detect(image = finn_image)

## ----finn, fig.height=4, fig.width=3, eval = FALSE-----------------------
#  library(magick)
#  library(ggplot2)
#  library(scales)
#  
#   finn_image %>% image_read() %>% image_ggplot() +
#     geom_rect(data = finn_face,
#               aes(xmin = top_left_x, xmax = top_left_x + width,
#                   ymin = top_left_y, ymax = top_left_y + height),
#               fill = NA, linetype = 'dashed', size = 2, color = '#377eb8') +
#     geom_label(data = finn_face,
#               aes(x = chin_tip_x, y = chin_tip_y + 20,
#                   label = paste('Gender:',
#                                 percent(face_gender_male_confidence),
#                   'Male')), size = 6, color = '#377eb8') +
#     geom_label(data = finn_face,
#               aes(x = chin_tip_x, y = chin_tip_y + 60,
#                   label = paste('Ethnicity:', percent(face_black),
#                   'Black')), size = 6, color = '#377eb8') +
#     theme(legend.position="none")

## ----sw, fig.height=3, fig.width=4.8, eval = FALSE-----------------------
#  sw_img <- "https://upload.wikimedia.org/wikipedia/en/8/82/Leiadeathstar.jpg"
#  sw_faces <- detect(sw_img)
#  
#  sw_img %>% image_read() %>% image_ggplot() +
#     geom_rect(data = sw_faces,
#               aes(xmin = top_left_x , xmax =  top_left_x + width,
#                   ymin = top_left_y, ymax = top_left_y + height,
#                   color = factor(face_id)),
#               fill = NA, linetype = 'dashed', size = 2) +
#     geom_label(data = sw_faces,
#               aes(x = chin_tip_x, y = chin_tip_y + 15,
#                   label = face_gender_type,
#                   color = factor(face_id)), size = 8) +
#     theme(legend.position="none")

## ----recognize, eval = FALSE---------------------------------------------
#  finn_face <- enroll(image = finn_image,
#                      subject_id = 'finn', gallery = 'starwars')
#  finn_new <- 'https://upload.wikimedia.org/wikipedia/commons/b/b6/John_Boyega_by_Gage_Skidmore.jpg'
#  finn_rec <- recognize(image = finn_new, gallery = 'starwars',
#                        show_candidate_images = FALSE)

