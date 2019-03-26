context("test get_tournament_prize_pool is working")

test_that('function fails if no key has been set', {

 testthat::skip_on_cran()
 testthat::skip_on_travis()

 #fails if no key is provided and key has not been set
 expect_error(get_tournament_prize_pool(language = 'en',
                                        key = NULL),
              'The function cannot find an API key.')

 #registering key
 key_actions('register_key', Sys.getenv('RDota_KEY'))
 expect_error(get_tournament_prize_pool(language = 'en',
                                        key = NULL),
              NA)

 #make sure url contains the right path
 expect_true(grepl('GetTournamentPrizePool', get_tournament_prize_pool()$url))

 #make sure response received i.e. api working
 expect_equal(get_tournament_prize_pool()$response$status_code,
              200L)

 #make sure user_agent has been set properly
 expect_identical(
  get_tournament_prize_pool()$response$request$options$useragent,
  'http://github.com/lyzander/RDota2'
 )

 #make sure function returned a results list
 expect_true(is.data.frame(get_tournament_prize_pool()$content))

 #delete key
 key_actions('delete_key')

})
