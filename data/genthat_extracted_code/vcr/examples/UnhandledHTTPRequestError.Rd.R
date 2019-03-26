library(vcr)


### Name: UnhandledHTTPRequestError
### Title: UnhandledHTTPRequestError
### Aliases: UnhandledHTTPRequestError
### Keywords: datasets

### ** Examples

vcr_configure(dir = tempdir())
cassettes()
insert_cassette("turtle")
request <- Request$new("post", 'https://eu.httpbin.org/post?a=5',
  "", list(foo = "bar"))

err <- UnhandledHTTPRequestError$new(request)
err$request_description()
err$current_matchers()
err$match_request_on_headers()
err$match_request_on_body()
err$formatted_headers()
cat(err$formatted_headers(), "\n")
cat(err$cassettes_description(), "\n")
cat(err$cassettes_list(), "\n")
err$formatted_suggestions()
cat(err$format_bullet_point('foo bar', 1), "\n")
err$suggestion_for("use_new_episodes")
err$suggestions()
err$no_cassette_suggestions()
err$record_mode_suggestion()
err$has_used_interaction_matching()
err$match_requests_on_suggestion()

# err$construct_message()

# cleanup
unlink(tempdir())



