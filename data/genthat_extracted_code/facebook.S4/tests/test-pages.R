test_that("facebook.S4.pages", {
  
  skip_on_cran()
  
  setwd("../../")
  if(!file.exists("./.httr-oauth")) skip("Cannot authenticate. Skipping...")
  
  app.key <- Sys.getenv("FACEBOOK_CONNECTOR_APP", "")
  app.secret <- Sys.getenv("FACEBOOK_CONNECTOR_SECRET", "")
  
  fb_token <- fbOAuth(app.key, app.secret)
  
  pages <- FacebookPagesCollection("9thcirclegames,linuspage", fb_token)
  
  # Check for data types
  expect_is(pages, "FacebookPagesCollection")
  expect_is(as.list(pages), "list")
  expect_is(as.data.frame(pages), "data.frame")
  
  # Output list has 2 elements
  expect_equal(length(pages), 2)
  
  # Default fields are named as expected
  expect_identical(pages@fields, c("id", 
                                   "username", 
                                   "name", 
                                   "about", 
                                   "category", 
                                   "description", 
                                   "likes", 
                                   "link", 
                                   "talking_about_count"))
  
  # Unused fields when id is not a collection
  expect_null(pages@parent.collection)
  expect_equal(pages@parent, rep(as.character(NA), length(pages)))
  expect_equal(pages@type, rep(as.character(NA), length(pages)))
  
  # Replicate the collection
  replicate <- FacebookPagesCollection(pages)
  expect_identical(replicate@id, c("9thcirclegames", "linuspage"))
  expect_is(replicate@parent.collection, "FacebookPagesCollection")
  
  
  # Different set of fields
  expect_true("picture" %in% FacebookPagesCollection("9thcirclegames", fb_token, fields = c("id", "name", "picture"))@fields)
  
  # Metadata
  expect_equal(which(FacebookPagesCollection("9thcirclegames,linuspage", fb_token)@type != "page"), integer(0))
  
  # Build from mixed
  likes.pages <- FacebookPagesCollection(facebook.object.likes(FacebookUsersCollection("me", fb_token, fields = "")))
  
  expect_is(likes.pages@parent.collection, "FacebookMixedCollection")
  expect_is(likes.pages@parent.collection@parent.collection, "FacebookUsersCollection")
  
  expect_equal(length(likes.pages@parent.collection), length(likes.pages))
  expect_identical(likes.pages@id, likes.pages@parent.collection@id)
  
  # Errors
  expect_error(FacebookPagesCollection(FacebookUsersCollection("me", fb_token)))
  expect_error(FacebookPagesCollection("9thcirclegames", fb_toke, fields="blahblah"))
  
  # Clean the environment
  rm(list = ls())
  
})