## ----alterryx_setup------------------------------------------------------
alteryx_api_key <- "ALTERYX_API_KEY"
alteryx_secret_key <- "ALTERYX_API_SECRET"
alteryx_gallery <- "https://yourgallery.com/gallery"

options(alteryx_api_key = alteryx_api_key)
options(alteryx_secret_key = alteryx_secret_key)
options(alteryx_gallery = alteryx_gallery)

## ----get_all_resources, eval = FALSE-------------------------------------
#  subscription <- get_app()

## ----get_some_resources, eval = FALSE------------------------------------
#  request_params <- list(
#    limit = "5",
#    sortField = "uploaddate"
#  )
#  
#  subscription <- get_app(request_params)

## ----get_some_apps, eval = FALSE-----------------------------------------
#  request_params <- list(
#    packageType = "0",
#    limit = "5",
#    sortField = "uploaddate"
#  )
#  
#  subscription <- get_app(request_params)

## ----search_app_by_name, eval = FALSE------------------------------------
#  request_params <- list(
#    packageType = "0",
#    search = "api"
#  )
#  
#  subscriptions <- get_app(request_params)
#  app <- subscriptions[[1]]

## ----get_specific_app, eval = FALSE--------------------------------------
#  download_app(app)

## ----get_app_questions, eval = FALSE-------------------------------------
#  questions <- get_app_questions(app)

## ----build_answers, eval = FALSE-----------------------------------------
#  name_values <- list(
#    name = "runtime",
#    value = "3"
#  )
#  answers <- build_answers(name_values)

## ----build_many_answers, eval = FALSE------------------------------------
#  name_values1 <- list(
#    name = "one",
#    value = "1"
#  )
#  
#  name_values2 <- list(
#    name = "two",
#    value = "2"
#  )
#  
#  multiple_answers <- build_answers(name_values1,
#                                    name_values2)

## ----queue_job, eval = FALSE---------------------------------------------
#  job <- queue_job(app, answers)

## ----poll_job, eval = FALSE----------------------------------------------
#  job <- get_job(job)

## ----get_job_output, eval = FALSE----------------------------------------
#  output <- get_job_output(job)

