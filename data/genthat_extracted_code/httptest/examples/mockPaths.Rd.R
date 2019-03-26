library(httptest)


### Name: .mockPaths
### Title: Set an alternate directory for mock API fixtures
### Aliases: .mockPaths

### ** Examples

identical(.mockPaths(), ".")
.mockPaths("/var/somewhere/else")
identical(.mockPaths(), c("/var/somewhere/else", "."))
.mockPaths(NULL)
identical(.mockPaths(), ".")



