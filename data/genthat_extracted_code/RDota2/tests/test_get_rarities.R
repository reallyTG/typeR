context("test get_rarities is working")

test_that('function get_rarities works properly', {

 skip_on_cran()
 skip_on_travis()

 #fails if no key is provided and key has not been set
 expect_error(get_rarities(language = 'en',
                           key = NULL),
              'The function cannot find an API key.')

 #registering key
 key_actions('register_key', Sys.getenv('RDota_KEY'))
 expect_error(get_rarities(language = 'en',
                           key = NULL),
              NA)

 #make sure url contains the right path
 expect_true(grepl('GetRarities',
                   get_rarities()$url))

 #make sure response received i.e. api working
 expect_equal(get_rarities()$response$status_code,
              200L)

 #make sure user_agent has been set properly
 expect_identical(
  get_rarities()$response$request$options$useragent, 'http://github.com/lyzander/RDota2'
 )

 #make sure function returned a results list
 expect_true(is.data.frame(get_rarities()$content))

 #delete key
 key_actions('delete_key')

})
