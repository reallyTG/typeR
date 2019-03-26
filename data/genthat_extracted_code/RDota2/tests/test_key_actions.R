context("test key_actions works fine")

test_that('function key_actions works properly', {

 testthat::skip_on_cran()
 testthat::skip_on_travis()


 #fails if no key is provided
 expect_error(key_actions(action = 'register_key', value = NULL),
              'if action is register_key')

 #return error if invalid action is provided
 expect_error(key_actions(action = 'badargument'))

 #key value is set correctly
 expect_identical(key_actions(action = 'register_key', value = 'abc'),
                  'abc')

 #make sure get_key gets back the registered key
 expect_true({
  suppressMessages(key_actions('register_key', value = 'abc'))
  dump <- capture.output(key_actions('get_key'))
  grepl('abc', dump)
 })

 #make sure the process of registering and deleting a key works fine
 expect_identical({
  suppressMessages(key_actions('register_key', value = 'abc'))
  dump <- capture.output(key_actions('get_key'))
  out <- suppressMessages(key_actions('delete_key'))
  out
 }, NULL)

})
