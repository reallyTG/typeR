context("test get_game_items is working")

test_that('function fails if no key has been set', {

 testthat::skip_on_cran()
 testthat::skip_on_travis()

 #fails if no key is provided and key has not been set
 expect_error(get_game_items(language = 'en',
                             key = NULL),
              'The function cannot find an API key.')

 #registering key
 key_actions('register_key', Sys.getenv('RDota_KEY'))
 expect_error(get_game_items(language = 'en',
                             key = NULL),
              NA)

 #make sure url contains the right path
 expect_true(grepl('GetGameItems', get_game_items()$url))

 #make sure response received i.e. api working
 expect_equal(get_game_items()$response$status_code,
              200L)

 #make sure user_agent has been set properly
 expect_identical(
  get_game_items()$response$request$options$useragent,
  'http://github.com/lyzander/RDota2'
 )

 #make sure function returned a results list
 expect_true(is.data.frame(get_game_items()$content))

 #delete key
 key_actions('delete_key')

})
